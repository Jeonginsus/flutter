import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_number/screen/settingsScreen.dart';
import '../component/number_row.dart';
import '../constant/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> rannum = [123, 456, 789];
  int maxNum = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(onPressed: onlimitednum),
              _Contents(rannum: rannum),
              _Button(onPressed: onRanPressed),
            ],
          ),
        ),
      ),
    );
  }

  void onRanPressed() {
    final rand = Random();
    final Set<int> randList = {};
    while (randList.length < 3) {
      final number = rand.nextInt(maxNum);
      if (number >= 100) {
        randList.add(number);
      }
    }
    setState(() {
      rannum = randList.toList();
    });
  }
  void onlimitednum() async {
    final int? result = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SettingsScreen(maxNum:maxNum);
        },
      ),
    );
    if(result != null) {
      setState(() {
        maxNum = result;
      });
    }
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;
  const _Header({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.settings,
              color: RED_COLOR,
            ))
      ],
    );
  }
}

class _Contents extends StatelessWidget {
  final List<int> rannum;
  const _Contents({required this.rannum, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rannum
                .asMap()
                .entries
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(bottom: e.key == 2 ? 0 : 16.0),
                    child: Number_Row(nr:e.value),
                  ),
                )
                .toList()),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onPressed;
  const _Button({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: RED_COLOR),
        onPressed: onPressed,
        child: Text("생성하기"),
      ),
    );
  }
}
