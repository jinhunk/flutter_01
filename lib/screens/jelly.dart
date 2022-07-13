import 'package:flutter/material.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'dart:math' as math;

class Jelly extends StatelessWidget {
  final String jellynumber;
  final String jellynumberfrind;
  final String jellymoney;

  Jelly(
      {Key? key,
      required this.jellymoney,
      required this.jellynumber,
      required this.jellynumberfrind})
      : super(key: key);

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

  Widget bodydescription(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.11,
        height: MediaQuery.of(context).size.height / 8.5,
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
                jellynumber,
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
                width: MediaQuery.of(context).size.width / 4.0,
                height: MediaQuery.of(context).size.height / 40.5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        jellynumberfrind,
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
              left: 260.0,
              top: 35.0,
              child: Text(
                jellymoney,
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
      child: Container(
        width: MediaQuery.of(context).size.width / 1.11,
        height: MediaQuery.of(context).size.height / 13.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Color.fromARGB(255, 235, 177, 196)),
        child: Stack(
          children: [
            Positioned(
              top: 20.0,
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
              top: 18.0,
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
              '',
            ),
            SizedBox(
              height: 7.0,
            ),
            bodydescription(context, ''),
            SizedBox(
              height: 7.0,
            ),
            bodydescription(context, ''),
            SizedBox(
              height: 7.0,
            ),
            bodydescription(context, ''),
            SizedBox(
              height: 7.0,
            ),
            bodydescription(context, ''),
            SizedBox(
              height: 7.0,
            ),
            bodydescription(context, ''),
            SizedBox(
              height: 7.0,
            ),
            bodydescription(context, ''),
            SizedBox(
              height: 15.0,
            ),
            bodyend(context),
          ],
        ),
      ),
    );
  }
}
