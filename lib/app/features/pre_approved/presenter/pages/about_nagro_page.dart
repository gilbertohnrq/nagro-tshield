// coverage:ignore-file
import 'package:cached_network_image/cached_network_image.dart';
import 'package:finan/app/core/services/custom_image_svg/custom_svg_image.dart';
import 'package:finan/app/core/services/nagro_video_player/imp_nagro_video_player.dart';
import 'package:finan/app/core/services/nagro_video_player/network_video.dart';
import 'package:finan/app/core/services/nagro_video_player/presenter/full_screen_video_player.dart';
import 'package:finan/app/core/theme/components/base/nagro_scaffold.dart';
import 'package:finan/app/core/theme/components/nagro_shimmer.dart';
import 'package:finan/app/core/theme/theme.dart';
import 'package:finan/app/core/theme/theme_sizes.dart';
import 'package:finan/app/core/utils/constants/app_assets_constants.dart';
import 'package:finan/app/core/utils/constants/app_strings_constants.dart';
import 'package:finan/app/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:video_player/video_player.dart';

class AboutNagroPage extends StatefulWidget {
  const AboutNagroPage({super.key, required this.collection});

  final String collection;

  @override
  State<AboutNagroPage> createState() => _AboutNagroPageState();
}

class _AboutNagroPageState extends State<AboutNagroPage> {
  late Future<List<NetworkVideo>> _videoListFuture;
  final List<VideoPlayerController> _videoControllers = [];

  @override
  void initState() {
    super.initState();
    _videoListFuture = _fetchVideoList();
  }

  Future<List<NetworkVideo>> _fetchVideoList() async {
    final nagroVideoPlayer = ImpNagroVideoPlayer();
    final videos = await nagroVideoPlayer.reproduceVideosListByCollection(
      collectionName: widget.collection,
      tag: 'about_video',
    );

    _videoControllers
        .addAll(videos.map((video) => video.videoPlayerController));

    return videos;
  }

  @override
  void dispose() {
    for (final controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NagroScaffold(
      onTapAppBarBack: () => Modular.to.pop(),
      actions: [
        CustomSvgImage(
          assetName: Assets.blueLogo,
          height: ThemeSizes.h21,
        )
      ],
      child: FutureBuilder<List<NetworkVideo>>(
        future: _videoListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          } else if (snapshot.hasError) {
            return _buildError(snapshot.error.toString());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  conhecaUmPoucoDaNagro,
                  style: ThemeTypography.body1.copyWith(
                    fontSize: ThemeSpacings.s18,
                    fontWeight: FontWeight.w700,
                    color: ThemeColors.kTextBase,
                  ),
                ),
                const SizedBox(height: ThemeSpacings.s4),
                Text(
                  ondeAParceriaEOMaiorValor,
                  style: ThemeTypography.body2.copyWith(
                    color: ThemeColors.kTextLight,
                  ),
                ),
                const SizedBox(height: ThemeSpacings.s4),
                _buildVideoList(snapshot.data!),
              ],
            );
          } else {
            return const Center(child: Text(kNenhumVdeoEncontrado));
          }
        },
      ),
    );
  }

  Widget _buildLoading() {
    return Padding(
      padding: const EdgeInsets.all(ThemeSpacings.s24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NagroShimmer(
            borderRadius: BorderRadius.circular(ThemeRadius.r8),
            height: ThemeSizes.h250,
            width: ThemeSizes.w167,
          ),
          const SizedBox(width: ThemeSpacings.s16),
          NagroShimmer(
            borderRadius: BorderRadius.circular(ThemeRadius.r8),
            height: ThemeSizes.h250,
            width: ThemeSizes.w167,
          ),
        ],
      ),
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(kErroAoCarregarVdeos + error),
          const SizedBox(height: ThemeSpacings.s16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _videoListFuture = _fetchVideoList();
              });
            },
            child: const Text(tentarNovamente),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoList(List<NetworkVideo> videos) {
    return Expanded(
      child: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return Container(
            margin: const EdgeInsets.only(
                top: ThemeSpacings.s36, bottom: ThemeSpacings.s20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildVideoPlayer(video),
                const SizedBox(height: ThemeSpacings.s16),
                Text(
                  video.title,
                  style: ThemeTypography.body2.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ThemeColors.kTextBase,
                  ),
                ),
                const SizedBox(height: ThemeSpacings.s8),
                Text(
                  video.description,
                  style: ThemeTypography.body3.copyWith(
                    color: ThemeColors.kTextLight,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildVideoPlayer(NetworkVideo video) {
    return GestureDetector(
      onTap: () async {
        final future = await verifyAndroidVersion();
        future
            ? launchVideo(video.urlYoutube)
            : Navigator.push(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenVideoPlayer(
                      controller: video.videoPlayerController),
                ),
              );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ThemeRadius.r8),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: video.thumbnail,
              height: ThemeSizes.h247,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const SizedBox.shrink(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Positioned(
              left: ThemeSpacings.s12,
              bottom: ThemeSpacings.s12,
              child: Container(
                height: ThemeSizes.w45,
                width: ThemeSizes.w45,
                decoration: BoxDecoration(
                  color: ThemeColors.kAccent,
                  borderRadius: BorderRadius.circular(ThemeRadius.r100),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: ThemeColors.kDark,
                  size: ThemeSpacings.s28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
