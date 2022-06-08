import 'package:flutter/material.dart';
import 'package:flutter_01/GetX/Personal_card.dart';
import 'package:get/route_manager.dart';

class Rx extends StatelessWidget {
  const Rx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: PersonalCart(),
    );
  }
}
