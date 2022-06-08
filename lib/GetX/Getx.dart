import 'package:flutter/material.dart';
import 'package:flutter_01/GetX/cpntroller.dart';

import 'package:get/get.dart';

class Getx extends StatelessWidget {
  const Getx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller controller = Get.put(Controller());
    // 심플 스테이프 매니저
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetBuilder<Controller>(
            init: Controller(),
            builder: (_) => Text(
              'Current value is :${Get.find<Controller>().x}',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<Controller>().increment(); //find 찾기
            },
            child: Text('Add Number'),
          ),
        ],
      )),
    );
  }
}
