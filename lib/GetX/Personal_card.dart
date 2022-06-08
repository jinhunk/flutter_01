import 'package:flutter/material.dart';
import 'package:flutter_01/GetX/controller.dart';
import 'package:get/get.dart';

class PersonalCart extends StatelessWidget {
  PersonalCart({Key? key}) : super(key: key);
  final Controller2 controller = Get.put(Controller2());
  //obs에 사용 init 따로 저장

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 82, 163, 230),
              ),
              child: Center(
                child: GetX<Controller2>(
                  builder: (_) => Text(
                    'Name: ${controller.person().name}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 82, 163, 230),
              ),
              child: Center(
                child: Obx(
                  (() => Text(
                        'Age:${controller.person().age}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 82, 163, 230),
              ),
              child: Center(
                  child: GetX(
                init: Controller2(),
                builder: ((controller) => Text(
                      'gender:${Get.find<Controller2>().person().gender}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateInfo();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
