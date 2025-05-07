// coverage:ignore-file
import 'package:cached_network_image/cached_network_image.dart';
import 'package:finan/app/core/services/nagro_video_player/network_video.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_shadows.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NagroVideoPlayer extends StatefulWidget {
  const NagroVideoPlayer({super.key, required this.video});
  final NetworkVideo video;

  @override
  State<NagroVideoPlayer> createState() => _NagroVideoPlayerState();
}

class _NagroVideoPlayerState extends State<NagroVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ThemeSizes.h256,
      width: ThemeSizes.w167,
      child: Column(
        children: [
          VideoPlayerComponent(video: widget.video),
          VideoInfoComponent(video: widget.video),
        ],
      ),
    );
  }
}

class VideoPlayerComponent extends StatelessWidget {
  final NetworkVideo video;

  const VideoPlayerComponent({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final future = await verifyAndroidVersion();
        future
            ? launchVideo(video.urlYoutube)
            : Modular.to.pushNamed(
                'video-player-full-screen',
                arguments: video.videoPlayerController,
              );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ThemeRadius.r8),
          topRight: Radius.circular(ThemeRadius.r8),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: ThemeSizes.h140,
              width: ThemeSizes.w167,
              child: FittedBox(
                fit: BoxFit.cover,
                child: CachedNetworkImage(
                  imageUrl: video.thumbnail,
                  placeholder: (context, url) => const SizedBox.shrink(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.video_collection),
                ),
              ),
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                height: ThemeSizes.h32,
                width: ThemeSizes.w32,
                decoration: BoxDecoration(
                  color: ThemeColors.kPrimary400,
                  borderRadius: BorderRadius.circular(ThemeRadius.r100),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: ThemeColors.kAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoInfoComponent extends StatelessWidget {
  final NetworkVideo video;
  const VideoInfoComponent({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ThemeSizes.h106,
      width: ThemeSizes.w167,
      decoration: const BoxDecoration(
        boxShadow: ThemeShadows.md,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(ThemeRadius.r8),
          bottomRight: Radius.circular(ThemeRadius.r8),
        ),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeSpacings.s12,
            vertical: ThemeSpacings.s8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                video.title,
                style: ThemeTypography.body3.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ThemeColors.kTextBase,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: ThemeSpacings.s4),
              Text(
                video.description,
                style: ThemeTypography.body3.copyWith(
                  fontSize: ThemeSpacings.s9comma6.sp,
                  fontWeight: FontWeight.w300,
                  color: ThemeColors.kTextLight,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
