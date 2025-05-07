// coverage:ignore-file
//coverage:ignore-file

import 'package:finan/app/core/services/cloud_firestore/cloud_firestore_service.dart';

abstract class INagroVideoPlayer {
  final CloudFirestoreService cloudFirestoreService;
  INagroVideoPlayer({required this.cloudFirestoreService});

  void reproduceVideoByNetwork({required String id});
  void reproduceVideosListByCollection({required String collectionName, required String tag});
}
