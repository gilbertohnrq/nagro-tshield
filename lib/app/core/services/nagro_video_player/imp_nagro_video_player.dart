// coverage:ignore-file
//coverage:ignore-file

import 'package:finan/app/core/services/cloud_firestore/cloud_firestore_service.dart';
import 'package:finan/app/core/services/cloud_firestore/cloud_firestore_service_impl.dart';
import 'package:finan/app/core/services/nagro_video_player/i_nagro_video_player.dart';
import 'package:finan/app/core/services/nagro_video_player/network_video.dart';
import 'package:finan/app/core/utils/constants/app_constants.dart';
import 'package:video_player/video_player.dart';

class ImpNagroVideoPlayer implements INagroVideoPlayer {
  late final Map<String, dynamic>? networkVideo;
  late final String urlVideo;

  @override
  CloudFirestoreService get cloudFirestoreService =>
      CloudFirestoreServiceImpl();

  @override
  Future<VideoPlayerController> reproduceVideoByNetwork(
      {required String id}) async {
    networkVideo =
        await cloudFirestoreService.read(externalResourcesByVideo, id);

    return NetworkVideo.fromJson(networkVideo!).videoPlayerController;
  }

  @override
  Future<List<NetworkVideo>> reproduceVideosListByCollection(
      {required String collectionName, required String tag}) async {

    final listCollection = await cloudFirestoreService.list(collectionName, tag);

    return listCollection.map((video) => NetworkVideo.fromJson(video)).toList();
  }
}
