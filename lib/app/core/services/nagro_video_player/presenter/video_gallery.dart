// coverage:ignore-file
import 'package:finan/app/core/services/nagro_video_player/imp_nagro_video_player.dart';
import 'package:finan/app/core/services/nagro_video_player/network_video.dart';
import 'package:finan/app/core/services/nagro_video_player/presenter/nagro_video_player.dart';
import 'package:finan/app/core/theme/components/nagro_shimmer.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoGallery extends StatefulWidget {
  const VideoGallery({super.key, required this.collection});
  final String collection;

  @override
  State<VideoGallery> createState() => _VideoGalleryState();
}

class _VideoGalleryState extends State<VideoGallery> {
  late Future<List<NetworkVideo>> _videoListFuture;

  @override
  void initState() {
    super.initState();
    _videoListFuture = _fetchVideoList();
  }

  Future<List<NetworkVideo>> _fetchVideoList() async {
    final nagroVideoPlayer = ImpNagroVideoPlayer();
    return await nagroVideoPlayer.reproduceVideosListByCollection(
        collectionName: widget.collection, tag: 'home_video');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NetworkVideo>>(
      future: _videoListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(ThemeSpacings.s24),
            child: Row(
              children: [
                NagroShimmer(
                  borderRadius: BorderRadius.circular(ThemeRadius.r8),
                  height: ThemeSizes.h250,
                  width: ThemeSizes.w167,
                ),
                const SizedBox(
                  width: ThemeSpacings.s16,
                ),
                NagroShimmer(
                  borderRadius: BorderRadius.circular(ThemeRadius.r8),
                  height: ThemeSizes.h250,
                  width: ThemeSizes.w167,
                ),
              ],
            ),
          ));
        } else if (snapshot.hasError) {
          return ErrorComponent(error: snapshot.error.toString());
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return VideoListComponent(videos: snapshot.data!);
        } else {
          return const Center(child: SizedBox.shrink());
        }
      },
    );
  }
}

class ErrorComponent extends StatelessWidget {
  final String error;
  const ErrorComponent({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(kErroAoCarregarVdeos + error));
  }
}

class VideoListComponent extends StatelessWidget {
  final List<NetworkVideo> videos;
  const VideoListComponent({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: ThemeSpacings.s24, vertical: ThemeSpacings.s4),
          child: Text(
            bemVindoANagro,
            style: ThemeTypography.body3.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: ThemeSpacings.s16),
        SizedBox(
          height: ThemeSizes.h250,
          child: ListView.builder(
            itemCount: videos.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  right: index == videos.length - 1
                      ? ThemeSpacings.s24
                      : ThemeSpacings.s16,
                  left: index == 0 ? ThemeSpacings.s24 : ThemeSpacings.s4,
                ),
                child: NagroVideoPlayer(video: videos.elementAt(index)),
              );
            },
          ),
        ),
      ],
    );
  }
}
