import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';

enum AppBackendFilters<T> with DwBackendFiltersMixin<T> {
  userId<int>(),
  // toUserId<int>(),
  // isRead<bool>(),
}
