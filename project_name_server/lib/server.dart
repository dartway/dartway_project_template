import 'package:dartway_auth_serverpod_server/dartway_auth_serverpod_server.dart'
    as dartway_auth;
import 'package:project_name_server/src/web/routes/root.dart';
import 'package:serverpod/serverpod.dart';

import 'src/dartway/dartway_auth.dart';
import 'src/dartway/dartway_core.dart';
import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: dartway_auth.authenticationHandler,
  );

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  await initDartwayCore(pod);
  await initDartwayAuth(pod);

  await pod.start();
}
