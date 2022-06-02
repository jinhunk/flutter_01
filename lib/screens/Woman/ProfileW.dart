import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/Model/UserModel.dart';

import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/Onboarding.dart';
import 'package:flutter_01/screens/Setting.dart';
import 'package:flutter_01/screens/Woman/ProfileRefreshW.dart';
import 'package:image_picker/image_picker.dart';

class ProfileW extends StatefulWidget {
  const ProfileW({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileWState createState() => _ProfileWState();
}

class _ProfileWState extends State<ProfileW> {
  File? singleImage;
  final _singlePicker = ImagePicker();
  int _curIndex = 0;

  UserModel models = UserModel();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    userdata();
  }

  Future<void> userdata() async {
    await firebaseFirestore
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      this.models = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colorss.indexColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                icon:
                    const Icon(Icons.settings, color: Colors.white, size: 24.0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingPage()));
                }),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   clipBehavior: Clip.antiAliasWithSaveLayer,
                //   margin: const EdgeInsets.only(left: 15.0, top: 20.0),
                //   width: MediaQuery.of(context).size.width / 2.55,
                //   height: MediaQuery.of(context).size.height / 4.5,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10.0),
                //       border: Border.all(color: Colorss.indexColor)),
                // ),

                Container(
                  padding: EdgeInsets.only(left: 10.0, top: 20.0),
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundImage: NetworkImage("${models.imageURL} "),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 40.0),
                  child: Row(
                    children: [
                      if (models.name != null) ...[
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            "${models.name} , ",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                      if (models.height != null) ...[
                        Text(
                          "${models.height}cm , ",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                      if (models.address != null) ...[
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            "${models.address} ",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 50.0,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colorss.indexColor),
                child: TextButton(
                  onPressed: () {
                    // getSingleImage();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileRefreshW()),
                    );
                  },
                  child: const Text(
                    '프로필 수정',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 70.0,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 70.0,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: const Color.fromARGB(255, 127, 184, 231)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Onboarding()),
                    );
                  },
                  child: const Text(
                    '친구요청',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20.5,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colorss.indexColor)),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height / 2.26,
              width: MediaQuery.of(context).size.width / 1.0,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 15.0, top: 20.0),
                            width: MediaQuery.of(context).size.width / 2.55,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colorss.indexColor)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.pinkAccent,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10.0,
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(left: 15.0, top: 20.0),
                            width: MediaQuery.of(context).size.width / 2.55,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colorss.indexColor)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.pinkAccent,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 15.0, top: 20.0),
                            width: MediaQuery.of(context).size.width / 2.55,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colorss.indexColor)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.pinkAccent,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10.0,
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(left: 15.0, top: 20.0),
                            width: MediaQuery.of(context).size.width / 2.55,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colorss.indexColor)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.pinkAccent,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 15.0, top: 20.0),
                            width: MediaQuery.of(context).size.width / 2.55,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colorss.indexColor)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.pinkAccent,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10.0,
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(left: 15.0, top: 20.0),
                            width: MediaQuery.of(context).size.width / 2.55,
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colorss.indexColor)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.pinkAccent,
                              size: 30.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getSingleImage() async {
    final pickedImage =
        await _singlePicker.pickImage(source: (ImageSource.gallery));
    setState(() {
      if (pickedImage != null) {
        singleImage = File(pickedImage.path);
      } else {
        print('노 이미지');
      }
    });
  }
}
