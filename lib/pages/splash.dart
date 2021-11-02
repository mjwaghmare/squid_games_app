import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'root.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // for video player
  VideoPlayerController _controller;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/squid_game_logo_video.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
    new Future.delayed(const Duration(milliseconds: 6500), () {
      Get.offAll(() => RootPage(), transition: Transition.fadeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          // Use the VideoPlayer widget to display the video.
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}
