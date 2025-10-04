import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:project_name_server/src/generated/protocol.dart';

final waterIntakeCrudConfig = DwCrudConfig<WaterIntake>(
  table: WaterIntake.t,
  getListConfig: DwGetListConfig(),
  saveConfig: DwSaveConfig<WaterIntake>(
    allowSave: (session, initialModel, newModel) async =>
        session.isUser(newModel.userProfileId),
  ),
);
