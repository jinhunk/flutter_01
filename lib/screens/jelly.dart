import 'package:flutter/material.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'dart:math' as math;

class Jelly extends StatefulWidget {
  Jelly({
    Key? key,
  }) : super(key: key);

  @override
  State<Jelly> createState() => _JellyState();
}

class _JellyState extends State<Jelly> {
  Widget header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.0,
      height: MediaQuery.of(context).size.height / 9.5,
      decoration: BoxDecoration(color: Color.fromARGB(255, 231, 117, 155)),
      child: Stack(
        children: [
          Positioned(
            left: 30,
            right: 23,
            top: 22,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '모든 젤리 구매 시 이용권 추가 지급!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '상품 구매 후 3일 동안 사용 가능',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          Positioned(
            left: 300,
            top: 10,
            child: Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 60.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyheader() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Text(
            '젤리 구매',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget bodydescription(BuildContext context, String title, String description,
      String description2, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.11,
        height: MediaQuery.of(context).size.height / 9.5,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 204, 201, 201)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20.0,
              left: 13.0,
              child: Transform.rotate(
                angle: -20 * math.pi / 180,
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
                  width: MediaQuery.of(context).size.width / 12.0,
                  child: Text(
                    'Jelly',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 53.0,
              top: 15.0,
              child: Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              left: 14.0,
              top: 50.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 236, 235, 235),
                ),
                width: MediaQuery.of(context).size.width / 3.8,
                height: MediaQuery.of(context).size.height / 40.5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.handshake,
                        size: 17.0,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        description2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 250.0,
              top: 25.0,
              child: Text(
                number,
                style: TextStyle(
                    color: Color.fromARGB(255, 129, 126, 126),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodydescription1and1(BuildContext context, String title,
      String description, String description2, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.11,
        height: MediaQuery.of(context).size.height / 9.5,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 204, 201, 201)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20.0,
              left: 13.0,
              child: Transform.rotate(
                angle: -20 * math.pi / 180,
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
                  width: MediaQuery.of(context).size.width / 12.0,
                  child: Text(
                    'Jelly',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 53.0,
              top: 15.0,
              child: Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              left: 14.0,
              top: 50.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 236, 235, 235),
                ),
                width: MediaQuery.of(context).size.width / 3.4,
                height: MediaQuery.of(context).size.height / 40.5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: Colors.amber,
                        size: 17,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 140.0,
              top: 50.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 236, 235, 235),
                ),
                width: MediaQuery.of(context).size.width / 3.8,
                height: MediaQuery.of(context).size.height / 40.5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.handshake,
                        size: 17.0,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        description2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 250.0,
              top: 25.0,
              child: Text(
                number,
                style: TextStyle(
                    color: Color.fromARGB(255, 129, 126, 126),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodydescription2(BuildContext context, String title,
      String description, String description2, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.11,
        height: MediaQuery.of(context).size.height / 9.5,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 204, 201, 201)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20.0,
              left: 13.0,
              child: Transform.rotate(
                angle: -20 * math.pi / 180,
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
                  width: MediaQuery.of(context).size.width / 12.0,
                  child: Text(
                    'Jelly',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 53.0,
              top: 15.0,
              child: Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              left: 14.0,
              top: 50.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 236, 235, 235),
                ),
                width: MediaQuery.of(context).size.width / 3.2,
                height: MediaQuery.of(context).size.height / 40.5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: Colors.amber,
                        size: 17,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 140.0,
              top: 50.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 236, 235, 235),
                ),
                width: MediaQuery.of(context).size.width / 3.7,
                height: MediaQuery.of(context).size.height / 40.5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.handshake,
                        size: 17.0,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        description2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 250.0,
              top: 25.0,
              child: Text(
                number,
                style: TextStyle(
                    color: Color.fromARGB(255, 129, 126, 126),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodydescription3(BuildContext context, String title,
      String description, String description2, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.11,
        height: MediaQuery.of(context).size.height / 9.5,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 204, 201, 201)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20.0,
              left: 13.0,
              child: Transform.rotate(
                angle: -20 * math.pi / 180,
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
                  width: MediaQuery.of(context).size.width / 12.0,
                  child: Text(
                    'Jelly',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 53.0,
              top: 15.0,
              child: Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              left: 14.0,
              top: 50.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 241, 240, 240),
                ),
                width: MediaQuery.of(context).size.width / 3.2,
                height: MediaQuery.of(context).size.height / 40.5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: Colors.amber,
                        size: 17,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 140.0,
              top: 50.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 236, 235, 235),
                ),
                width: MediaQuery.of(context).size.width / 3.7,
                height: MediaQuery.of(context).size.height / 40.5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, left: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.handshake,
                        color: Colors.amber,
                        size: 17,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        description2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 240.0,
              top: 25.0,
              child: Text(
                number,
                style: TextStyle(
                    color: Color.fromARGB(255, 129, 126, 126),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyend(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.11,
          height: MediaQuery.of(context).size.height / 18.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Color.fromARGB(255, 245, 219, 228)),
          child: Stack(
            children: [
              Positioned(
                top: 15.0,
                left: 90.0,
                child: Transform.rotate(
                  angle: -20 * math.pi / 180,
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
                    width: MediaQuery.of(context).size.width / 17.0,
                    child: Text(
                      '',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12.0,
                left: 120.0,
                child: Text(
                  '무료 젤리 받는 방법',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          _bodybottombuttonalert(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 65,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 30.0, color: Colors.black54),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 66.0),
          child: Row(
            children: [
              Text(
                '내 젤리 ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: Text(
                  '0개',
                  style: TextStyle(
                      color: Color.fromARGB(255, 224, 99, 141),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(context),
            bodyheader(),
            bodydescription(
              context,
              '젤리 15개',
              '프로필 보기 1회권',
              '친구 요청 1회권',
              '  7,500원',
            ),
            SizedBox(
              height: 7.0,
            ),
            bodydescription1and1(
              context,
              '젤리 30개',
              '프로필 보기 1회권',
              '친구 요청 1회권',
              '11,000원',
            ),
            SizedBox(
              height: 7.0,
            ),
            bodydescription1and1(
              context,
              '젤리 60개',
              '프로필 보기 1회권',
              '친구 요청 2회권',
              '17,000원',
            ),
            SizedBox(
              height: 7.0,
            ),
            bodydescription2(
              context,
              '젤리 130개',
              '프로필 보기 2회권',
              '친구 요청 3회권',
              '31,000원',
            ),
            SizedBox(
              height: 7.0,
            ),
            bodydescription2(
              context,
              '젤리 400개',
              '프로필 보기 10회권',
              '친구 요청 5회권',
              '89,000원',
            ),
            SizedBox(
              height: 7.0,
            ),
            bodydescription3(
              context,
              '젤리 800개',
              '프로필 보기 12회권',
              '친구 요청 1회권',
              '169,000원',
            ),
            SizedBox(
              height: 7.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            bodyend(context),
          ],
        ),
      ),
    );
  }
}

Future<void> _bodybottombuttonalert(BuildContext context) async {
  return showDialog<void>(
    //다이얼로그 위젯 소환
    context: context,
    barrierDismissible: false, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.max,
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
                    '무료 젤리 받는 방법',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Icon(Icons.person, color: Colors.amber, size: 100.0)
                ],
              ),
            ),
            content: Column(
              children: [
                Text(
                  '위픽 메뉴에서 40명을 소개받을 때마다',
                  style: TextStyle(color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '젤리 1개',
                      style: TextStyle(color: Colors.pink),
                    ),
                    Text(
                      '받을 수 있습니다.',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
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
                        width: MediaQuery.of(context).size.width / 1.4,
                        height: MediaQuery.of(context).size.height / 18.0,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            '확인',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
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
