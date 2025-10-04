import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';

enum AppBackendFilters<T> with DwBackendFiltersMixin<T> {
  userId<int>(),
  userProfileId<int>(),
  createdAt<DateTime>(),
  intakeTime<DateTime>();

  // toUserId<int>(),
  // isRead<bool>(),

  static DwBackendFilter userRecentPosts(int userId) => DwBackendFilter.and(
        [
          AppBackendFilters.userId.equals(userId),
          AppBackendFilters.createdAt.greaterThan(
            DateTime.now().subtract(
              const Duration(days: 1),
            ),
          ),
        ],
      );

  static DwBackendFilter userWaterIntake(int userId) => DwBackendFilter.and(
        [
          AppBackendFilters.userProfileId.equals(userId),
          AppBackendFilters.intakeTime.greaterThan(
            DateTime.now().subtract(
              const Duration(days: 1),
            ),
          ),
        ],
      );
}
