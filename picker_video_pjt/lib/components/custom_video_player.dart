import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  const CustomVideoPlayer({
    required this.video,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoplayercontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializeController();
  }

  initializeController() async {
    videoplayercontroller = VideoPlayerController.file(
      File(widget.video.path),
    );
    await videoplayercontroller!.initialize();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (videoplayercontroller == null) {
      return CircularProgressIndicator();
    }
    return VideoPlayer(
      videoplayercontroller!,
    );
  }
}
