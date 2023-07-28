import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Achievments extends StatelessWidget {
  const Achievments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
      ),
      body: Center(
        child: Text('This is a Achievements window'),
      ),
    );
  }
}