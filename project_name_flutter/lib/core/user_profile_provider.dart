import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_name_client/project_name_client.dart';

final userProfileProvider = Provider<UserProfile>((ref) {
  throw UnimplementedError('userProfileProvider must be overridden');
});

extension UserProfileWidgetRefExtension on WidgetRef {
  UserProfile get watchUserProfile => watch(userProfileProvider);

  UserProfile get readUserProfile => read(userProfileProvider);
}

extension UserProfileRefExtension on Ref {
  UserProfile get watchUserProfile => watch(userProfileProvider);

  UserProfile get readUserProfile => read(userProfileProvider);
}
