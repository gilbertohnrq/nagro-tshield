// coverage:ignore-file
//coverage:ignore-file

import 'package:video_player/video_player.dart';

class NetworkVideo {
  final VideoPlayerController videoPlayerController;
  final String title;
  final String description;
  final String thumbnail;
  final String urlYoutube;

  NetworkVideo({
    required this.videoPlayerController,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.urlYoutube,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
    };
  }

  factory NetworkVideo.fromJson(Map<String, dynamic> map) {
    return NetworkVideo(
        videoPlayerController:
            VideoPlayerController.networkUrl(Uri.parse(map['url']))
              ..setVolume(0.0),
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        thumbnail: map['thumbnail'] ?? '',
        urlYoutube: map['urlYoutube'] ?? '');
  }
}
