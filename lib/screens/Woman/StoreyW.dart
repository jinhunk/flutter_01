import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/Model/UserModel.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'dart:math' as math;

import 'package:flutter_01/screens/jelly.dart';
import 'package:flutter_01/screens/storey2.dart';

class StoreyW extends StatefulWidget {
  const StoreyW({Key? key}) : super(key: key);

  @override
  _FinState createState() => _FinState();
}

class _FinState extends State<StoreyW> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    userdata();
    tabController = TabController(length: 3, vsync: this);
  }

  UserModel models = UserModel();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (Storey2())));
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _tabMenu() {
    return TabBar(
        indicatorColor: Colors.black, // 탭바 밑에 줄 색깔
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.pink,
        controller: tabController,
        indicatorWeight: 1, // 탭바 밑에줄 굵기
        tabs: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              '최신순',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            child: Text(
              '인기순',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            child: Text(
              '댕냥이',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ]);
  }

  Widget _tabView() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(), // 스크롤 사용안함
        shrinkWrap: true, // 스크롤 사용여부
        itemCount: 100,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/김유정.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Text(
            '스토리',
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: Container(
            margin: EdgeInsets.only(bottom: 6.0),
            width: MediaQuery.of(context).size.width / 1.0,
            height: MediaQuery.of(context).size.height / 500.0,
            color: Color.fromARGB(255, 248, 245, 245),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Transform.rotate(
              angle: -20 * math.pi / 180,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (Jelly())));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  padding: EdgeInsets.only(top: 2.0),
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
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              _bodyheader(),
              _tabMenu(),
              _tabView(),
            ],
          ),
        ),
      ),
    );
  }
}
