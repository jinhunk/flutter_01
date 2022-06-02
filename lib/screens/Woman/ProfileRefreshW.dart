import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/Model/UserModel.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/Woman/ProfileW.dart';
import 'package:flutter_01/screens/Woman_page.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRefreshW extends StatefulWidget {
  const ProfileRefreshW({Key? key}) : super(key: key);

  @override
  _ProfileRefreshWState createState() => _ProfileRefreshWState();
}

class _ProfileRefreshWState extends State<ProfileRefreshW> {
  File? singleImage;
  final _singlePicker = ImagePicker();
  UserModel models = UserModel();
  @override
  void initState() {
    super.initState();
    userdata();
  }

  Future<void> userdata() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      this.models = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  // Future<void> userInfor() async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //   models.uid = FirebaseAuth.instance.currentUser!.uid;
  //   models.imageURL = ;

  //   await firebaseFirestore
  //       .collection("user")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .update(
  //     {
  //       '사진': models.imageURL,
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 82, 79, 79)),
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            Text(
              '프로필 수정',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Row(
              children: [
                GestureDetector(
                  child: const Text(
                    '저장',
                    style: TextStyle(color: Colorss.indexColor, fontSize: 18.0),
                  ),
                  onTap: () {
                    imageget();
                    alert(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                child: Row(
                  children: const [
                    Text(
                      '얼굴 사진',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '필수',
                      style: TextStyle(color: Colorss.indexColor),
                    ),
                  ],
                ),
              ),
              singleImage == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          margin: const EdgeInsets.only(left: 5.0, top: 20.0),
                          width: MediaQuery.of(context).size.width / 3.15,
                          height: MediaQuery.of(context).size.height / 6.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colorss.indexColor)),
                          child: IconButton(
                            onPressed: () {
                              getSingleImage();
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 30.0,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          margin: const EdgeInsets.only(left: 5.0, top: 20.0),
                          width: MediaQuery.of(context).size.width / 3.15,
                          height: MediaQuery.of(context).size.height / 6.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colorss.indexColor)),
                          child: IconButton(
                            onPressed: () {
                              getSingleImage();
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 30.0,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          margin: const EdgeInsets.only(left: 5.0, top: 20.0),
                          width: MediaQuery.of(context).size.width / 3.15,
                          height: MediaQuery.of(context).size.height / 6.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colorss.indexColor)),
                          child: IconButton(
                            onPressed: () {
                              getSingleImage();
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 30.0,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          margin: const EdgeInsets.only(left: 5.0, top: 20.0),
                          width: MediaQuery.of(context).size.width / 3.15,
                          height: MediaQuery.of(context).size.height / 6.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colorss.indexColor)),
                          child: InkWell(
                            onTap: () {
                              getSingleImage();
                            },
                            child: Image.file(
                              singleImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          margin: const EdgeInsets.only(left: 5.0, top: 20.0),
                          width: MediaQuery.of(context).size.width / 3.15,
                          height: MediaQuery.of(context).size.height / 6.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colorss.indexColor)),
                          child: InkWell(
                            onTap: () {
                              getSingleImage();
                            },
                            child: Image.file(
                              singleImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          margin: const EdgeInsets.only(left: 5.0, top: 20.0),
                          width: MediaQuery.of(context).size.width / 3.15,
                          height: MediaQuery.of(context).size.height / 6.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colorss.indexColor)),
                          child: InkWell(
                            onTap: () {
                              getSingleImage();
                            },
                            child: Image.file(
                              singleImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      '매력 어필 사진',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.only(left: 5.0, top: 20.0),
                    width: MediaQuery.of(context).size.width / 3.15,
                    height: MediaQuery.of(context).size.height / 6.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colorss.indexColor)),
                    child: IconButton(
                      onPressed: () {
                        getSingleImage();
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 30.0,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.only(left: 5.0, top: 20.0),
                    width: MediaQuery.of(context).size.width / 3.15,
                    height: MediaQuery.of(context).size.height / 6.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colorss.indexColor)),
                    child: IconButton(
                      onPressed: () {
                        getSingleImage();
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 30.0,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.only(left: 5.0, top: 20.0),
                    width: MediaQuery.of(context).size.width / 3.15,
                    height: MediaQuery.of(context).size.height / 6.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colorss.indexColor)),
                    child: IconButton(
                      onPressed: () {
                        getSingleImage();
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 30.0,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 226, 222, 222)),
                    ),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                          ),
                          child: Text(
                            '성별',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                        if (models.address != null) ...[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.0, right: 5.0),
                            child: Text(
                              "${models.gender} ",
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
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 226, 222, 222)),
                    ),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            '닉네임',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                        if (models.name != null) ...[
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10.0,
                            ),
                            child: Text(
                              '${models.name}',
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
            ],
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

  Future<void> imageget() async {
    final refImage = FirebaseStorage.instance.ref().child("images").child('');
    await refImage.putFile(singleImage!);
    final url = await refImage.getDownloadURL();

    models.imageURL = url;

    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
      {
        '사진': models.imageURL,
      },
    );
  }

  void alert(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: true, // 바탕화면 누르면 안내창 사라짐
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                "저장했습니다.",
                style: TextStyle(fontSize: 15.0),
              ),
              actions: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height / 18,
                          child: TextButton(
                              child: Text(
                                "확인",
                                style: TextStyle(
                                    color: Colorss.indexColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const WomanPage()));
                                });
                              })),
                      // Container(
                      //     width: MediaQuery.of(context).size.width / 4,
                      //     height: MediaQuery.of(context).size.height / 18,
                      //     child: TextButton(
                      //         child: Text(
                      //           "아니요",
                      //           style: TextStyle(
                      //               color: Colors.blue,
                      //               fontSize: 14,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //         onPressed: () {
                      //           Navigator.pop(context);
                      //         })),
                    ]),
              ]);
        });
  }
}
