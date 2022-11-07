import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_number/constant/colors.dart';

import '../component/number_row.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNum;
  const SettingsScreen({required this.maxNum, Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _num = 1000;
  @override
  void initState() {
    // TODO: implement initState
    _num =widget.maxNum.toDouble();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              _body(
                mnum: _num,
              ),
              _footer(
                onPressed: settingend,
                onChange: limitchange,
                mnum: _num,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void limitchange(double val) {
    setState(() {
      _num = val;
    });
  }

  void settingend() {
    Navigator.of(context).pop(_num.toInt());
  }
}

class _body extends StatelessWidget {
  final double mnum;
  const _body({required this.mnum, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Number_Row(nr:mnum.toInt()),
      ),
    );
  }
}

class _footer extends StatelessWidget {
  final ValueChanged<double>? onChange;
  final VoidCallback onPressed;
  final double mnum;
  const _footer(
      {required this.onChange,
      required this.onPressed,
      required this.mnum,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: mnum,
          min: 1000,
          max: 100000,
          onChanged: onChange,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: RED_COLOR,
            ),
            child: Text("설정"),
          ),
        )
      ],
    );
  }
}
