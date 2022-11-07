import 'package:flutter/cupertino.dart';

class Number_Row extends StatelessWidget {
  final int nr;
  const Number_Row({required this.nr, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: nr
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
    );
  }
}

