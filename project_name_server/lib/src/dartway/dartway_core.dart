import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:project_name_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

late final DwCore<UserProfile> dw;

initDartwayCore(Serverpod serverpod) {
  dw = DwCore.init<UserProfile>(
    userProfileTable: UserProfile.t,
    crudConfigurations: [],
    userProfileConstructor: ({
      required int userInfoId,
      required DwAuthDataStash dwDataStash,
    }) async =>
        UserProfile(
      userInfoId: userInfoId,
      phone: dwDataStash.identifier,
      firstName: dwDataStash.data['firstName'] ?? '',
      conditionsAcceptedAt: DateTime.now(),
      agreedForMarketingCommunications: bool.tryParse(
              dwDataStash.data['agreedForMarketingCommunications'] ?? '') ??
          false,
    ),
  );

  DwPhoneAuthConfig.set(DwPhoneAuthConfig.defaultDevelopmentConfig);
}
