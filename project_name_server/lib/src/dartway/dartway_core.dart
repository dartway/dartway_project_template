import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:project_name_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

import '../crud/user_profile_config.dart';

late final DwCore<UserProfile> dw;

initDartwayCore(Serverpod serverpod) {
  dw = DwCore<UserProfile>(
    userProfileGetter: (
      Session session, {
      required int userInfoId,
    }) async =>
        UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userInfoId),
    ),
    crudConfigurations: <DwCrudConfig>[
      userProfileConfig,
    ],
  );
}
