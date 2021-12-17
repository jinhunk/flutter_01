import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeNext extends StatefulWidget {
  const HomeNext({Key? key}) : super(key: key);

  @override
  _HomeNextState createState() => _HomeNextState();
}

class _HomeNextState extends State<HomeNext> {
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [
                Expanded(
                    child: Image.asset(
                  'images/dice$leftDice.jpg',
                )),
                Expanded(
                    child: Image.asset(
                  'images/dice$rightDice.jpg',
                )),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                leftDice = Random().nextInt(4) + 1;
                rightDice = Random().nextInt(4) + 1;
              });
            },
            icon: Icon(Icons.play_arrow),
          ),
        ],
      ),
    );
  }
}
