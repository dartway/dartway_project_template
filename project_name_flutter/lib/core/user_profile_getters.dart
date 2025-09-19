import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_name_client/project_name_client.dart';

// const _descriptor =
//     NitRepositoryDescriptor<UserProfile, int>(fieldName: 'userId');

extension UserProfileWidgetRefExtension on WidgetRef {
  UserProfile? get watchUserProfile => !signedIn
      ? DwRepository.getDefault<UserProfile>()
      : watchModelCustomAsync<UserProfile>(
          backendFilter: userProfileBackendFilter!,
        ).value!;

  UserProfile? get readUserProfile => !signedIn
      ? null
      : watchModelCustomAsync<UserProfile>(
          backendFilter: userProfileBackendFilter!,
        ).maybeWhen(data: (value) => value, orElse: () => null);
}

extension UserProfileRefExtension on Ref {
  UserProfile? get watchUserProfile => !signedIn
      ? null
      : watchModelCustomAsync<UserProfile>(
          backendFilter: userProfileBackendFilter!,
        ).value!;

  UserProfile? get readUserProfile => !signedIn
      ? null
      : watchModelCustomAsync<UserProfile>(
              backendFilter: userProfileBackendFilter!)
          .maybeWhen(
          data: (value) => value,
          orElse: () => null,
        );
}
