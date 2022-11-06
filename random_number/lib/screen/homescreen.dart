import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var rannum = [123, 456, 789];
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
              Row(
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
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        color: RED_COLOR,
                      ))
                ],
              ),
              Expanded(
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
                              padding: EdgeInsets.only(
                                  bottom: e.key == 2 ? 0 : 16.0),
                              child: Row(
                                children: e.value
                                    .toString()
                                    .split("")
                                    .map(
                                      (x) => Image.asset(
                                        "asset/img/$x.png",
                                        height: 70.0,
                                        width: 50.0,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          )
                          .toList()),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: RED_COLOR),
                  onPressed: () {},
                  child: Text("생성하기"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
