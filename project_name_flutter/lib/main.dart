// ignore: unused_import
import 'dart:io';

import 'package:dartway_app/dartway_app.dart';
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_name_client/project_name_client.dart';
import 'package:project_name_flutter/build_info.dart';
import 'package:project_name_flutter/core/app_core.dart';
import 'package:project_name_flutter/core/default_models.dart';

import 'core/router/router.dart';

void main() async {
  DwApp(
    title: 'Awesome DartWay Project',
    routerProvider: appRouterProvider,
    dwConfig: const DwConfig(
      defaultModelGetter: DwRepository.getDefault,
    ),
    flutterAppOptions: DwFlutterAppOptions(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 4, 49, 57),
        ),
      ),
    ),
    appInitializers: [
      (ref) async => ref.initDartwayServerpodApp<UserProfile>(
            client: AppCore.initServerpodClient(
              BuildInfo.backendUrl,
            ),
            initRepositoryFunction: DefaultModels.initRepository,
          ),
    ],
  ).run();
}
