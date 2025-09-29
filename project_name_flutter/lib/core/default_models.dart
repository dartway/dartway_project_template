import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:project_name_client/project_name_client.dart';

class DefaultModels {
  static initRepository() {
    DwRepository.setupRepository(
      defaultModel: UserProfile(
        id: DwRepository.mockModelId,
        userInfoId: DwRepository.mockModelId,
        firstName: 'Dartway',
        phone: '79999999999',
        agreedForMarketingCommunications: true,
        conditionsAcceptedAt: DateTime.now(),
      ),
    );

    DwRepository.setupRepository(
      defaultModel: FeedPost(
        id: DwRepository.mockModelId,
        title: 'Feed Post',
        text: 'Feed Post Content',
        createdAt: DateTime.now(),
        authorProfileId: DwRepository.mockModelId,
      ),
    );
  }
}
