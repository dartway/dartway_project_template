import 'package:dartway_auth_serverpod_server/dartway_auth_serverpod_server.dart';
import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:project_name_server/src/generated/protocol.dart';
// import 'package:serverpod_auth_server/serverpod_auth_server.dart';

final userProfileConfig = DwCrudConfig<UserProfile>(
  table: UserProfile.t,
  post: DwPostConfig(
    allowUpdate: (session, model) => session.isUser(model.id!),
  ),
  getOneCustomConfigs: [
    DwGetOneConfig(
      filterPrototype: DwBackendFilter.equalsPrototype(fieldName: 'phone'),
    ),
    DwGetOneConfig(
      filterPrototype: DwBackendFilter.equalsPrototype(
        fieldName: 'userInfoId',
      ),
      createIfMissing: (session, filter) async {
        final userInfo =
            await UserInfo.db.findById(session, filter.fieldValue!);

        if (userInfo == null) return null;

        // final random = Random();

        final dwDataStash = await DwAuthDataStash.db.findFirstRow(
          session,
          where: (t) =>
              t.identifier.equals(userInfo.userIdentifier) &
              t.type.equals(DwPhoneVerificationRequestType.registration.name),
        );

        if (dwDataStash == null) {
          throw Exception(
            'No registration data found for user ${userInfo.userIdentifier}',
          );
        }

        final firstName = dwDataStash.data['firstName']!;

        final profile = await session.db.insertRow<UserProfile>(
          UserProfile(
            userInfoId: userInfo.id!,
            phone: userInfo.userIdentifier,
            firstName: firstName,
            conditionsAcceptedAt: DateTime.now(),
            agreedForMarketingCommunications: bool.tryParse(
                    dwDataStash.data['agreedForMarketingCommunications'] ??
                        '') ??
                false,
          ),
        );

        return profile;
      },
    ),
  ],
);
