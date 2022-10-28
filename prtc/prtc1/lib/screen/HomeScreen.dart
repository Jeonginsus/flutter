import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      color: Colors.orange,
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      color: Colors.blue,
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      color: Colors.green,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.orange,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      color: Colors.orange,
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      color: Colors.blue,
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      color: Colors.green,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.green,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
