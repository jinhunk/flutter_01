import 'package:flutter/material.dart';
import 'package:flutter_01/screens/ProfileclickBottomSheet.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class Profileclick extends StatefulWidget {
  Profileclick({Key? key}) : super(key: key);

  @override
  State<Profileclick> createState() => _ProfileclickState();
}

class _ProfileclickState extends State<Profileclick> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late PersistentBottomSheetController controller;
  final List _image = [
    'https://img.hankyung.com/photo/202112/01.28455721.1.jpg',
    'http://img.tf.co.kr/article/home/2021/12/30/202192951640828857.jpg',
    'https://pbs.twimg.com/media/EZA-l2AU8AEELFG.jpg',
  ];

  Future<void> _Photoalert(BuildContext context) async {
    return showDialog<void>(
      //다이얼로그 위젯 소환
      context: context,
      barrierDismissible: true, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              titlePadding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              title: Column(
                children: [
                  Text('신고'),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: 500,
                    color: Colors.black12,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('차단'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _bodyPhoto() {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: Container(
        height: 370,
        // width: 0,
        // color: Colors.red,
        child: Stack(
          children: [
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  _image[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: _image.length,
              viewportFraction: 1.0, //뷰포트분수
              scale: 1.0, //사진간의 간격
              pagination: new SwiperPagination(
                margin: new EdgeInsets.all(20.0), //쪽수애니메이션
                builder: DotSwiperPaginationBuilder(
                    color: Colors.grey, activeColor: Colors.white),
              ),
              loop: false, //재반복여부
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onTap: () {
                      _Photoalert(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyone() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                '진민이,',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                '26',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '서울 동대문구 ,',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 17),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '5.6km',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 17),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '181cm,',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 17),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'AB형',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 17),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              _Phone(),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 1,
            width: 600,
            color: Colors.black12,
          ),
          SizedBox(
            height: 20,
          ),
          _Text('학교', '고등학교 졸업'),
          SizedBox(
            height: 20,
          ),
          _Text('직업', '전문직'),
          SizedBox(
            height: 20,
          ),
          _Text('소개', '동네친구 만들수 있어요..??!'),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 1,
            width: 500,
            color: Colors.black12,
          ),
          SizedBox(
            height: 20,
          ),
          _Text('종교', '기독교'),
          SizedBox(
            height: 20,
          ),
          _Text('음주', '가끔'),
          SizedBox(
            height: 20,
          ),
          _Text('흡연', '비흡연'),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _Text(String title, String title2) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 17),
        ),
        SizedBox(
          width: 100,
        ),
        Text(
          title2,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 17),
        ),
      ],
    );
  }

  Widget _Phone() {
    return Container(
      width: 120,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3.0, top: 3.0),
                child: Icon(
                  Icons.phone,
                  color: Colors.teal[200],
                  size: 20,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  '전화번호 인증',
                  style: TextStyle(
                      color: Colors.teal[200], fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _bottomNavigationBar(
    String title,
  ) {
    return Container(
      height: 50,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.teal[300],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
    );
  }

  Widget _bottomNavigationBar2(
    String title,
  ) {
    return Container(
      height: 50,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue[400],
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bodyPhoto(),
            SizedBox(
              height: 20.0,
            ),
            _bodyone(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 140,
        child: Column(
          children: [
            _bottomNavigationBar('괜찮아요'),
            SizedBox(
              height: 10,
            ),
            _bottomNavigationBar2('친구 요청'),
          ],
        ),
      ),
    );
  }
}
