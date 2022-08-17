import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/Model/UserModel.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'dart:math' as math;

import 'package:flutter_01/screens/jelly.dart';
import 'package:flutter_01/screens/storey2.dart';
import 'package:get/get.dart';

class StoreyW extends StatefulWidget {
  const StoreyW({Key? key}) : super(key: key);

  @override
  _FinState createState() => _FinState();
}

class _FinState extends State<StoreyW> with TickerProviderStateMixin {
  final List<String> _tabthree = [
    'https://images.mypetlife.co.kr/content/uploads/2021/10/19151330/corgi-g1a1774f95_1280-1024x682.jpg',
    'https://images.mypetlife.co.kr/content/uploads/2019/09/09152937/blind-dog-2-1024x683.jpg',
    'https://cdnweb01.wikitree.co.kr/webdata/editor/202103/02/img_20210302105652_f4642f08.webp',
    'https://t1.daumcdn.net/cfile/tistory/9982424C5F56648032',
    'https://image.edaily.co.kr/images/Photo/files/NP/S/2022/03/PS22032301333.jpg',
    'https://cdn.newspenguin.com/news/photo/202006/1837_5156_215.jpg'
  ];
  final List<String> _tabtwo = [
    'http://file.instiz.net/data/file/20130629/2/1/2/212a2b8986d48c67903194655f2130a2',
    'https://t1.daumcdn.net/cfile/tistory/273B3A475882346E13',
    'http://www.safetimes.co.kr/news/photo/201711/51302_19070_3918.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBcTJe6IfIA0MA6X8v1NlPPO0lB70JvS7Kug&usqp=CAU',
    'https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/iz/2021/04/29/6bbc25b9-e735-4d0b-a59d-fb7a99e0723d.jpg',
    'https://file.mk.co.kr/meet/neds/2021/02/image_readmed_2021_155171_16135128614543079.jpg'
  ];
  final List<String> _tabone = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBcTJe6IfIA0MA6X8v1NlPPO0lB70JvS7Kug&usqp=CAU',
    'https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/iz/2021/04/29/6bbc25b9-e735-4d0b-a59d-fb7a99e0723d.jpg',
    'https://file.mk.co.kr/meet/neds/2021/02/image_readmed_2021_155171_16135128614543079.jpg',
    'http://file.instiz.net/data/file/20130629/2/1/2/212a2b8986d48c67903194655f2130a2',
    'https://t1.daumcdn.net/cfile/tistory/273B3A475882346E13',
    'http://www.safetimes.co.kr/news/photo/201711/51302_19070_3918.jpg',
  ];

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
                Get.to(
                  Storey2(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _tabMenu() {
    return Column(
      children: [
        TabBar(
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
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.white,
            height: 1000,
            child: TabBarView(
              controller: tabController,
              children: [
                Tabone(),
                Tabtwo(),
                Tabthree(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget Tabone() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(), // 스크롤 사용안함
        shrinkWrap: true, // 스크롤 사용여부
        itemCount: _tabone.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _tabone[index],
            fit: BoxFit.fill,
          );
        });
  }

  Widget Tabtwo() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(), // 스크롤 사용안함
        shrinkWrap: true, // 스크롤 사용여부
        itemCount: _tabtwo.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _tabtwo[index],
            fit: BoxFit.fill,
          );
        });
  }

  Widget Tabthree() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(), // 스크롤 사용안함
        shrinkWrap: true, // 스크롤 사용여부
        itemCount: _tabthree.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _tabthree[index],
            fit: BoxFit.fill,
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
      body: ListView(children: [
        _bodyheader(),
        _tabMenu(),
      ]),
    );
  }
}
