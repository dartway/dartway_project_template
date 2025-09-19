import 'package:dartway_auth_serverpod_server/dartway_auth_serverpod_server.dart';
import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

initDartwayAuth(Serverpod serverpod) {
  DwPhoneAuthConfig.set(
    DwPhoneAuthConfig(
      // TODO: добавить в конфиг
      secretHashKey: serverpod.server.passwords['phoneVerificationHashKey'] ??
          'phoneVerificationHashKey',
      maxInitVerificationRequests: 100,
      maxAllowedVerificationAttempts: 100,
      initVerificationCallback:
          (session, phoneNumber, verificationOneTimePassword,
              {verificationExtraParams}) async {
        session.log(verificationOneTimePassword);

        Future.delayed(
          Duration(seconds: 1),
          () => DwPhoneAuth.postOnVerificationStream(
            session,
            phoneNumber: phoneNumber,
            message: DwAppNotification(
              toUserId: 0,
              title: verificationOneTimePassword,
            ),
          ),
        );

        return true;
      },
    ),
  );
}
