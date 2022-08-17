import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/jelly.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '스토리',
          style: TextStyle(
              color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Transform.rotate(
            angle: -20 * math.pi / 180,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (Jelly())));
              },
              child: Container(
                // margin: EdgeInsets.only(right: 10.0),
                padding: EdgeInsets.only(top: 2.0, bottom: 5.0),

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 235, 229, 229),
                        Colorss.indexColor,
                      ]),
                  color: Colors.pink,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7.0),
                      topRight: Radius.circular(7.0),
                      bottomLeft: Radius.circular(11.0),
                      bottomRight: Radius.circular(11.0)),
                ),
                width: MediaQuery.of(context).size.width / 10.0,
                child: Text(
                  'Jelly',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
