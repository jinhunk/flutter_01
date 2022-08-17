import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/Model/UserModel.dart';
import 'package:flutter_01/screens/storey2.dart';
import 'package:get/get.dart';

class Storybody extends StatelessWidget {
  Storybody({Key? key}) : super(key: key);

  UserModel models = UserModel();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> userdata() async {
    await firebaseFirestore
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      this.models = UserModel.fromMap(value.data());
    });
  }

  Widget _bodyheader(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 4.6,
            height: MediaQuery.of(context).size.height / 7.5,
            child: CircleAvatar(
              radius: 70.0,
              backgroundImage: NetworkImage("${models.imageURL} "),
              child: Stack(
                children: [
                  Positioned(
                    top: 70.0,
                    left: 65.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 20.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.pink),
                      child: Text(
                        '+',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontSize: 20.0, height: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 30.0,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 85.0),
              child: Text(
                '어떤 친구를 만나고 싶나요?',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.6,
                height: MediaQuery.of(context).size.height / 19.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Color.fromARGB(255, 55, 78, 207),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 58.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.border_color,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        '스토리 작성하기',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Get.to(Storey2());
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _bodyheader(context),
      ],
    );
  }
}
