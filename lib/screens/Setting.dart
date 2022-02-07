import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/LoginPage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var _latitude = '';
  var _longitude = '';
  var _altitude = '';
  var _speed = '';
  var _address = '위치';

  Future<void> _updatePosition() async {
    Position pos = await _determinePosition();
    List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    setState(() {
      _latitude = pos.latitude.toString();
      _longitude = pos.longitude.toString();
      _altitude = pos.altitude.toString();
      _speed = pos.speed.toString();
      _address = pm[0].toString();
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled; //서비스가능
    LocationPermission permission; //허가
    //위치 서비스가 활성화되었는지 테스트합니다.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 위치 서비스가 활성화되지 않음 계속하지 않음
      // 위치에 액세스하고 사용자를 요청합니다.
      // 위치 서비스를 활성화하는 앱.
      return Future.error('위치 서비스가 비활성화되었습니다.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 권한이 거부되었습니다. 다음에 시도할 수 있습니다.
        // 권한을 다시 요청합니다(여기도
        // 안드로이드의 shouldShowRequestPermissionRationale
        // true를 반환했습니다. 안드로이드 가이드라인에 따르면
        // 이제 앱에 설명 UI가 표시되어야 합니다.
        return Future.error('위치 권한이 거부되었습니다.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // 권한은 영원히 거부됩니다. 적절하게 처리하십시오.
      return Future.error('위치 권한이 영구적으로 거부되었습니다. 권한을 요청할 수 없습니다..');
    }

    // 여기에 도달하면 권한이 부여되고
    // 장치의 위치에 계속 액세스합니다.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colorss.indexColor,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                icon: Icon(Icons.settings),
                color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 9.0,
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      onPressed: () {},
                      child: Text(
                        '아는 사람 만나지 않기',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.grey,
                height: MediaQuery.of(context).size.height / 500.0,
                width: MediaQuery.of(context).size.width / 1.0,
              ),
              ElevatedButton(
                child: Row(children: [
                  Icon(
                    Icons.lock_open,
                    color: Colorss.indexColor,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "로그아웃",
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      ))
                ]),
                onPressed: () {
                  setState(() {
                    alertLogOut(context);
                  });
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  // overlayColor: MaterialStateProperty.all(Colors.grey[300]),
                ),
              ),
              Container(
                color: Colors.grey,
                height: MediaQuery.of(context).size.height / 500.0,
                width: MediaQuery.of(context).size.width / 1.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(
                      '지역',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(
                      '활동지역',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.0,
                  ),
                  TextButton.icon(
                    onPressed: _updatePosition,
                    icon: Icon(
                      Icons.location_on,
                      color: Colorss.indexColor,
                    ),
                    label: Text(
                      _address,
                      style: TextStyle(color: Colorss.indexColor),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 60.0,
              ),
              Container(
                color: Colors.grey,
                height: MediaQuery.of(context).size.height / 500.0,
                width: MediaQuery.of(context).size.width / 1.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(
                      '약관',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 7.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        '서비스 이용 약관',
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 7.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('개인정보 보호 약관',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 7.0,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('위치정보 이용약관',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 7.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('사업자 정보',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0)),
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.grey,
                height: MediaQuery.of(context).size.height / 500.0,
                width: MediaQuery.of(context).size.width / 1.0,
              ),
            ],
          )
        ],
      ),
    );
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
  }

  void alertLogOut(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: true, // 바탕화면 누르면 안내창 사라짐
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                "로그아웃 하시겠습니까?",
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
                                "네",
                                style: TextStyle(
                                    color: Colorss.indexColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                setState(() {
                                  _logout();
                                  Navigator.pop(context);
                                  _snackBarLogout(); // 스낵바 추가 & 페이지 이동
                                });
                              })),
                      Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 18,
                          child: TextButton(
                              child: Text(
                                "아니요",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              })),
                    ]),
              ]);
        });
  }

  void _snackBarLogout() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colorss.indexColor,
        content: Text('로그아웃이 되었습니다',
            style: TextStyle(color: Colors.white, fontSize: 15.0))));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
