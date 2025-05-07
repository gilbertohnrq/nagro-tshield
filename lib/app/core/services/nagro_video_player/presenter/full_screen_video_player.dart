// coverage:ignore-file
//coverage:ignore-file

import 'package:finan/app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;

  const FullScreenVideoPlayer({super.key, required this.controller});

  @override
  State<FullScreenVideoPlayer> createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late double aspectRatio;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    setState(() {
      isLoading = true;
    });

    await widget.controller.initialize();
    await widget.controller.setVolume(1.0);
    await widget.controller.play();
    setState(() {
      aspectRatio = widget.controller.value.aspectRatio;
      isLoading = false;
    });
  }

  Future<void> _handlePop() async {
    await widget.controller.pause();
    await widget.controller.setVolume(0.0);
    await widget.controller.seekTo(Duration.zero);
  }

  @override
  void dispose() {
    _handlePop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : AspectRatio(
                    aspectRatio: aspectRatio,
                    child: VideoPlayer(widget.controller),
                  ),
          ),
          Positioned(
            top: 60,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close,
                  color: Colors.white, size: ThemeSpacings.s30),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
