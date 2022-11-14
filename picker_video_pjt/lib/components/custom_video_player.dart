import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  final VoidCallback onNewVideoPressed;

  const CustomVideoPlayer({
    required this.onNewVideoPressed,
    required this.video,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoplayercontroller;
  Duration currentPosition = Duration();
  bool showControls =false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializeController();
  }
  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget){
    super.didUpdateWidget(oldWidget);

    if(oldWidget.video.path != widget.video.path){
      initializeController();
    }
  }

  initializeController() async {
    currentPosition = Duration();
    videoplayercontroller = VideoPlayerController.file(
      File(widget.video.path),
    );
    await videoplayercontroller!.initialize();

    videoplayercontroller!.addListener(() {
      final currentPosition = videoplayercontroller!.value.position;

      setState(() {
        this.currentPosition = currentPosition;
      });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (videoplayercontroller == null) {
      return CircularProgressIndicator();
    }
    return AspectRatio(
      aspectRatio: videoplayercontroller!.value.aspectRatio,
      child: GestureDetector(
        onTap: (){
          setState(() {
            showControls = !showControls;
          });
        },
        child: Stack(
          children: [
            VideoPlayer(
              videoplayercontroller!,
            ),
            if (showControls)
              videoController(
                onPlayPressed: onPlayPressed,
                onForwardPressed: onForwardPressed,
                onReversePressed: onReversePressed,
                isPlayed: videoplayercontroller!.value.isPlaying,
            ),
            if (showControls)
              _NewVideo(
                onPressed: widget.onNewVideoPressed,
              ),
            _slider(
              onChanged: NewVideoPressed,
              currentPosition: currentPosition,
              videoController: videoplayercontroller!,
            ),
          ],
        ),
      ),
    );
  }

  void NewVideoPressed(double val) {
    videoplayercontroller!.seekTo(
      Duration(
        seconds: val.toInt(),
      ),
    );
  }

  void onPlayPressed() {
    setState(() {
      if (videoplayercontroller!.value.isPlaying) {
        videoplayercontroller!.pause();
      } else {
        videoplayercontroller!.play();
      }
    });
  }

  void onForwardPressed() {
    final maxPosition = videoplayercontroller!.value.duration;
    final currentPosition = videoplayercontroller!.value.position;
    Duration position = maxPosition;
    if ((maxPosition - Duration(seconds: 3)).inSeconds >
        currentPosition.inSeconds) {
      position = currentPosition + Duration(seconds: 3);
    }
    videoplayercontroller!.seekTo(position);
  }

  void onReversePressed() {
    final currentPosition = videoplayercontroller!.value.position;
    Duration position = Duration();
    if (currentPosition.inSeconds > 3) {
      position = currentPosition - Duration(seconds: 3);
    }
    videoplayercontroller!.seekTo(position);
  }
}

class videoController extends StatelessWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onReversePressed;
  final VoidCallback onForwardPressed;
  final bool isPlayed;

  const videoController({
    required this.onPlayPressed,
    required this.onForwardPressed,
    required this.onReversePressed,
    required this.isPlayed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      height: MediaQuery.of(context).size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          renderIconButton(
            onPressed: onReversePressed,
            iconData: Icons.rotate_left,
          ),
          renderIconButton(
            onPressed: onPlayPressed,
            iconData: isPlayed ? Icons.pause : Icons.play_arrow,
          ),
          renderIconButton(
            onPressed: onForwardPressed,
            iconData: Icons.rotate_right,
          ),
        ],
      ),
    );
  }

  Widget renderIconButton({
    required VoidCallback onPressed,
    required IconData iconData,
  }) {
    return IconButton(
      onPressed: onPressed,
      iconSize: 30.0,
      color: Colors.white,
      icon: Icon(
        iconData,
      ),
    );
  }
}

class _NewVideo extends StatelessWidget {
  final VoidCallback onPressed;
  const _NewVideo({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
        onPressed: onPressed,
        color: Colors.white,
        iconSize: 30.0,
        icon: Icon(Icons.photo_camera_back),
      ),
    );
  }
}

class _slider extends StatelessWidget {
  final VideoPlayerController videoController;
  final ValueChanged<double> onChanged;
  final Duration currentPosition;
  const _slider({
    required this.currentPosition,
    required this.onChanged,
    required this.videoController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          children: [
            Text(
              '${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Slider(
                value: currentPosition.inSeconds.toDouble(),
                onChanged: onChanged,
                max: videoController!.value.duration.inSeconds.toDouble(),
                min: 0,
              ),
            ),
            Text(
              '${videoController!.value.duration.inMinutes}:${(videoController!.value.duration.inSeconds % 60).toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
