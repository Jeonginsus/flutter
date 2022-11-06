import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text('랜덤숫자 생성기'),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                  ))
            ],
          ),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
