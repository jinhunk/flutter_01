import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/jelly.dart';
import 'package:flutter_01/screens/suggestion_page.dart';

import '../../Model/UserModel.dart';
import 'dart:math' as math;

class HomeW extends StatefulWidget {
  const HomeW({Key? key}) : super(key: key);

  @override
  _HomeWState createState() => _HomeWState();
}

class _HomeWState extends State<HomeW> with TickerProviderStateMixin {
  double angle = 50.0;
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    userdata();
    super.initState();
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

  Widget SuggestionPages() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(right: 270.0),
          child: Text(
            '오늘의 추천',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        ...List.generate(
          5,
          (index) =>
              SuggestionPage(userId: '진민이, 27', description: '20 분전 , 5.2km'),
        ).toList(),
      ]),
    );
  }

  Widget loungebody(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.12,
            height: MediaQuery.of(context).size.height / 3.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: Color.fromARGB(255, 232, 204, 236),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 23,
                  right: 23,
                  top: 40,
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '내 동네 순위 확인하기',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '7월 6일(수) 인기도 결과',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 12.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 199, 154, 207)),
                          onPressed: () {},
                          child: Text(
                            '내 랭킹 보러가기',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 124, 9, 145)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 240,
                  // right: 25,
                  top: 0,
                  bottom: 100,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4.0,
                    height: MediaQuery.of(context).size.height / 3.8,
                    child: CircleAvatar(
                      radius: 70.0,
                      backgroundImage: NetworkImage("${models.imageURL} "),
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  // right: 25,
                  top: 15,

                  child: Container(
                    width: MediaQuery.of(context).size.width / 10,
                    // height: MediaQuery.of(context).size.height / 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        'NEW',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          loungebody2(),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              loungebody3('첫인상\n확인하기'),
              loungebody3('프로필\n평가받기'),
            ],
          ),
        ],
      ),
    );
  }

  Widget loungebody2() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.12,
      height: MediaQuery.of(context).size.height / 2.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: Color.fromARGB(255, 199, 235, 199)),
      child: Stack(
        children: [
          Positioned(
            left: 23,
            right: 23,
            top: 40,
            // bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '보이스톡, 목소리로 대화해요!',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '매일 새로운 친구와 횟수 제한 없이 통화',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CircleAvatar(
                  radius: 70.0,
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/474x/73/5d/6d/735d6d9a98c0acf64a291dc1fc442aa9.jpg"),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 12.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 173, 231, 173)),
                    onPressed: () {},
                    child: Text(
                      '더 알아보기',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: (Color.fromARGB(255, 96, 192, 99)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 22,
            // right: 25,
            top: 15,
            child: Container(
              width: MediaQuery.of(context).size.width / 10,
              // height: MediaQuery.of(context).size.height / 45.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 38, 199, 43)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Text(
                  '무료',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loungebody3(String title) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.37,
          height: MediaQuery.of(context).size.height / 4.5,
          decoration: BoxDecoration(
              color: Colors.amber[50], borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Positioned(
                left: 25,
                right: 25,
                top: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 50,
                top: 90,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.0,
                  height: MediaQuery.of(context).size.height / 14.5,
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-vector/smile-face-with-peace-hippie-gesture-t-shirt-print-vector-hand-drawn-cartoon-character-illustration-smile-emoji-face-peace-gesture-print-for-t-shirt-poster-sticker-logo-concept_92289-3342.jpg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leadingWidth: 130,
        leading: Column(
          children: [
            TabBar(
              padding: EdgeInsets.only(left: 5.0),
              labelPadding: EdgeInsets.symmetric(
                horizontal: 0.0,
              ),
              // isScrollable: true,
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              tabs: [
                Tab(
                  child: Text(
                    '추천',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    '라운지',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (Jelly(
                                jellymoney: '7,500원',
                                jellynumber: '젤리 15개',
                                jellynumberfrind: '친구 요청 1회권',
                              ))));
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
      body: TabBarView(
        controller: _tabController,
        children: [
          SuggestionPages(),
          loungebody(context),
        ],
      ),
    );
  }
}
