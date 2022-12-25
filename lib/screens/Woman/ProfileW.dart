import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_01/GetX/RX.dart';

import 'package:flutter_01/Model/UserModel.dart';

import 'package:flutter_01/confing/Colors.dart';

import 'package:flutter_01/screens/Setting.dart';
import 'package:flutter_01/screens/Woman/ProfileRefreshW.dart';
import 'package:flutter_01/screens/animal.dart';
import 'package:flutter_01/screens/profilecertification.dart';
import 'package:flutter_01/screens/profiletop.dart';
import 'package:flutter_01/screens/voice.dart';
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
  } //초기화

  Future<void> userdata() async {
    await firebaseFirestore
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      this.models = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  Widget _bodyheader() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 3.0),
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 13.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromARGB(255, 222, 237, 250)),
        child: Stack(
          children: [
            Positioned(
              left: 20.0,
              top: 15.0,
              child: Image.asset(
                'images/편지이미지원본.jpg',
                height: 30.0,
                width: 25.0,
              ),
            ),
            Positioned(
              left: 60,
              right: 23,
              top: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '사연 보내기',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '윙클에서 친구 & 커플 된 사연 보내고 선물 받기!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const profiletop()),
        );
      },
    );
  }

  Widget _bodytop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3.2,
          height: MediaQuery.of(context).size.height / 5.0,
          padding: EdgeInsets.only(top: 40.0),
          child: CircleAvatar(
            radius: 70.0,
            backgroundImage: NetworkImage("${models.imageURL} "),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Padding(
          padding: EdgeInsets.only(right: 40.0, top: 70.0),
          child: Column(
            children: [
              GestureDetector(
                child: Row(
                  children: [
                    Icon(Icons.mic),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('목소리 등록'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Voice()),
                  );
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                width: MediaQuery.of(context).size.width / 2.9,
                height: MediaQuery.of(context).size.height / 600.5,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 236, 236),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Icon(Icons.pets),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('반려동물 등록ㅎ'),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Animal()),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                width: MediaQuery.of(context).size.width / 2.9,
                height: MediaQuery.of(context).size.height / 600.5,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 236, 236),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('프로필 인증'),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const profilecertification()));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bodytopbutton() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileRefreshW()),
            );
          },
          child: Container(
            margin: EdgeInsets.only(left: 27.0, top: 10.0),
            width: MediaQuery.of(context).size.width / 3.5,
            height: MediaQuery.of(context).size.height / 21.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.pink),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.border_color,
                  color: Colors.white,
                  size: 15.0,
                ),
                SizedBox(
                  width: 3.0,
                ),
                Text(
                  '프로필 수정',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bodybottom() {
    return Column(
      children: [
        Text(
          '프로필 평가 전',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 35.6,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 17.0),
              child: Text(
                '0점',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            Text(
              '5점',
              style: TextStyle(fontSize: 12.0),
            ),
            Padding(
              padding: EdgeInsets.only(right: 17.0),
              child: Text(
                '10점',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 5.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color.fromARGB(255, 209, 208, 208),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '인기도',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    Text(
                      '프로필 관심도',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '0%',
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Color.fromARGB(255, 25, 163, 30),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width / 500.1,
                    height: MediaQuery.of(context).size.height / 30.6,
                  ),
                  Text(
                    '0%',
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Color.fromARGB(255, 243, 223, 43),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '친구가 날 좋아할 확률입니다.',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromARGB(255, 180, 178, 178),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '내 프로필을 열어볼 확률입니다.',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromARGB(255, 180, 178, 178),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bodybottombutton() {
    return Column(
      children: [
        GestureDetector(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 18.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.pink),
              child: Text(
                '내 프로필 평가받기',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              )),
          onTap: () {
            _bodybottombuttonalert(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                icon:
                    const Icon(Icons.settings, color: Colors.pink, size: 27.0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingPage()));
                }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bodyheader(),
            _bodytop(),
            _bodytopbutton(),
            SizedBox(
              height: 55.0,
            ),
            _bodybottom(),
            SizedBox(
              height: 10.0,
            ),
            _bodybottombutton(),
          ],
        ),
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

Future<void> _bodybottombuttonalert(BuildContext context) async {
  return showDialog<void>(
    //다이얼로그 위젯 소환
    context: context,
    barrierDismissible: false, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: [
                  Text(
                    '프로필 평가를 시작할까요?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    '짧은 시간동안 많은 친구들에게 ',
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    '당신이 소개됩니다.',
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16.0),
                  ),
                ],
              ),
            ),
            content: Column(
              children: [
                Text(
                  '무료 : 1회',
                  style: TextStyle(color: Colors.pink),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.2,
                        height: MediaQuery.of(context).size.height / 18.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            '아니요',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 18.0),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.2,
                        height: MediaQuery.of(context).size.height / 18.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            '네',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.pink, fontSize: 18.0),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
