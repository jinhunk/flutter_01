import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _switch = true;
  bool _switch2 = true;

  Widget bodytopbutton() {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, top: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 13.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 43, 147, 231),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            Text(
              '아는 사람 만나지 않기',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(
              width: 40.0,
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 35.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget line() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      width: MediaQuery.of(context).size.width / 1.0,
      height: MediaQuery.of(context).size.height / 500.0,
      color: Color.fromARGB(255, 248, 245, 245),
    );
  }

  Widget bodymiddle1() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '지역',
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    '활동 지역',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 120.0,
                  ),
                  Text(
                    '경기도 구리시',
                    style: TextStyle(color: Colors.pink, fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.location_searching,
                    color: Colors.pink,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bodymiddle2() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '알림',
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    '매칭 알림',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 220.0,
                  ),
                  Container(
                    child: Switch(
                      value: _switch,
                      onChanged: (chack) {
                        setState(() {
                          _switch = chack;
                        });
                      },
                      activeColor: Colors.pink,
                    ),
                  ),
                ],
              ),
              Text(
                '새로운 친구 소개, 괜찮아요 알림을 받을 수 있습니다.',
                style: TextStyle(color: Colors.black54, fontSize: 14.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    '채팅 알림',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 220.0,
                  ),
                  Switch(
                    value: _switch2,
                    onChanged: (chack) {
                      setState(() {
                        _switch2 = chack;
                      });
                    },
                    activeColor: Colors.pink,
                  ),
                ],
              ),
              Text(
                '친구요청, 채팅 메세지 알림을 받을 수 있습니다.',
                style: TextStyle(color: Colors.black54, fontSize: 14.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bodymiddle3(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                description,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bodymiddle4(String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(),
        title: Text(
          '설정',
          style: TextStyle(color: Colors.black),
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
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            bodytopbutton(),
            line(),
            bodymiddle1(),
            line(),
            bodymiddle2(),
            line(),
            bodymiddle3('지원', '고객 문의'),
            SizedBox(
              height: 10.0,
            ),
            bodymiddle4('커뮤니티 가이드라인'),
            line(),
            bodymiddle3('약관', '서비스 이용약관'),
            SizedBox(
              height: 10.0,
            ),
            bodymiddle4('개인정보 보호약관'),
            SizedBox(
              height: 10.0,
            ),
            bodymiddle4('위치정보 이용약관'),
            SizedBox(
              height: 10.0,
            ),
            bodymiddle4('라이센스'),
            SizedBox(
              height: 10.0,
            ),
            bodymiddle4('사업자 정보'),
            SizedBox(
              height: 10.0,
            ),
            line(),
            bodymiddle3('계정', '계정 관리'),
            SizedBox(
              height: 10.0,
            ),
            bodymiddle4('계정 보호 가이드라인'),
          ],
        ),
      ),
    );
  }
}

//   void _logout() async {
//     await FirebaseAuth.instance.signOut();
//   }

//   void alertLogOut(BuildContext context) async {
//     showDialog(
//         context: context,
//         barrierDismissible: true, // 바탕화면 누르면 안내창 사라짐
//         builder: (BuildContext context) {
//           return AlertDialog(
//               title: Text(
//                 "로그아웃 하시겠습니까?",
//                 style: TextStyle(fontSize: 15.0),
//               ),
//               actions: <Widget>[
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                           width: MediaQuery.of(context).size.width / 5,
//                           height: MediaQuery.of(context).size.height / 18,
//                           child: TextButton(
//                               child: Text(
//                                 "네",
//                                 style: TextStyle(
//                                     color: Colorss.indexColor,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _logout();
//                                   Navigator.pop(context);
//                                   _snackBarLogout(); // 스낵바 추가 & 페이지 이동
//                                 });
//                               })),
//                       Container(
//                           width: MediaQuery.of(context).size.width / 4,
//                           height: MediaQuery.of(context).size.height / 18,
//                           child: TextButton(
//                               child: Text(
//                                 "아니요",
//                                 style: TextStyle(
//                                     color: Colors.blue,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               })),
//                     ]),
//               ]);
//         });
//   }

//   void _snackBarLogout() {
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         backgroundColor: Colorss.indexColor,
//         content: Text('로그아웃이 되었습니다',
//             style: TextStyle(color: Colors.white, fontSize: 15.0))));
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => LoginPage()));
//   }
// }
