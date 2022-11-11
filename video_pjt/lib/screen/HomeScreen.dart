import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeeScreen extends StatefulWidget {
  const HomeeScreen({Key? key}) : super(key: key);

  @override
  State<HomeeScreen> createState() => _HomeeScreenState();
}

class _HomeeScreenState extends State<HomeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("1"),
      ),
    );
  }
}
