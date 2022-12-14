import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picker_video_pjt/components/custom_video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: video == null ? renderEmpty() : renderVideo());
  }

  Widget renderVideo() {
    return Center(
      child: CustomVideoPlayer(
        onNewVideoPressed: onNewVideoPressed,
        video: video!,
      ),
    );
    ;
  }

  Widget renderEmpty() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: getBoxDecoration(),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _logo(
          onTap: onNewVideoPressed,
        ),
        SizedBox(
          height: 30.0,
        ),
        _body(),
      ]),
    );
  }

  void onNewVideoPressed() async {
    final video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    if (video != null) {
      setState(() {
        this.video = video;
      });
    }
  }

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2A3A7C),
            Color(0xFF000118),
          ]),
    );
  }

}

class _logo extends StatelessWidget {
  final VoidCallback onTap;
  const _logo({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset("asset/image/logo.png"),
    );
  }
}

class _body extends StatelessWidget {
  const _body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 40.0,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "VIDEO",
          style: textStyle,
        ),
        Text(
          "PLAYER!",
          style: textStyle.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
