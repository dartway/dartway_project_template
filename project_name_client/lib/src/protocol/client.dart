/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart'
    as _i3;
import 'package:dartway_auth_serverpod_client/dartway_auth_serverpod_client.dart'
    as _i4;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointDevelopment extends _i1.EndpointRef {
  EndpointDevelopment(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'development';

  _i2.Future<void> testNotification({required String notificationText}) =>
      caller.callServerEndpoint<void>(
        'development',
        'testNotification',
        {'notificationText': notificationText},
      );
}

class Modules {
  Modules(Client client) {
    dartway_core_serverpod = _i3.Caller(client);
    dartway_auth_serverpod = _i4.Caller(client);
    auth = _i5.Caller(client);
  }

  late final _i3.Caller dartway_core_serverpod;

  late final _i4.Caller dartway_auth_serverpod;

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    development = EndpointDevelopment(this);
    modules = Modules(this);
  }

  late final EndpointDevelopment development;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup =>
      {'development': development};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
        'dartway_core_serverpod': modules.dartway_core_serverpod,
        'dartway_auth_serverpod': modules.dartway_auth_serverpod,
        'auth': modules.auth,
      };
}
