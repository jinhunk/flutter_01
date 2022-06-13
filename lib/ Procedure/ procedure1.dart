import 'package:flutter/material.dart';
import 'package:flutter_01/%20Procedure/procedure2.dart';
import 'package:flutter_01/confing/Colors.dart';

class Procedure1 extends StatefulWidget {
  const Procedure1({Key? key}) : super(key: key);

  @override
  _Procedure1State createState() => _Procedure1State();
}

class _Procedure1State extends State<Procedure1> {
  bool value0 = false;

  bool value1 = false;

  bool value2 = false;

  bool value3 = false;

  bool value4 = false;

  bool valueaall = false;

  // bool _s0 = false;

  bool icon = false;
  bool icon1 = false;
  bool icon2 = false;
  bool icon3 = false;
  bool icon4 = false;
  bool iconall = false;
  Icon _iconCheck = Icon(
    Icons.check_circle_outline,
  );

  Icon _iconCheck2 =
      Icon(Icons.check_circle_outline, color: Colorss.indexColor);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Icon(
            Icons.ac_unit,
            color: Colors.black,
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: const Text(
              '이용약관에 동의해주세요',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25.0,
          ),
          CheckboxListTile(
              onChanged: (value) {
                icon = value!;
                setState(() {
                  if (icon && icon1 && icon2 && icon3 != false) {
                    next();
                  }
                });
              },
              title: const Text(
                '이용약관 동의 (필수)',
                style: TextStyle(color: Colors.black),
              ),
              value: icon,
              selected: icon,
              checkColor: Colors.white),
          CheckboxListTile(
              onChanged: (value) {
                setState(() {
                  icon1 = value!;
                });
              },
              title: const Text(
                '개인정보 수집 및 이용 동의 (필수)',
                style: TextStyle(color: Colors.black),
              ),
              value: icon1,
              selected: icon1,
              checkColor: Colors.white),
          CheckboxListTile(
              onChanged: (value) {
                icon2 = value!;
                setState(() {});
              },
              title: const Text(
                '위치정보 이용약관 동의 (필수)',
                style: TextStyle(color: Colors.black),
              ),
              value: icon2,
              selected: icon2,
              checkColor: Colors.white),
          CheckboxListTile(
              onChanged: (value) {
                icon3 = value!;
                setState(() {
                  if (icon && icon1 && icon2 && icon3 != _iconCheck2) {
                    next();
                  }
                });
              },
              title: const Text(
                '민감정보 이용약관 동의 (필수)',
                style: TextStyle(color: Colors.black),
              ),
              value: icon3,
              selected: icon3,
              checkColor: Colors.white),
          CheckboxListTile(
              onChanged: (value) {
                icon4 = value!;
                setState(() {});
              },
              title: const Text(
                '마케팅 수신 동의 (선택)',
                style: TextStyle(color: Colors.black),
              ),
              value: icon4,
              selected: icon4,
              checkColor: Colors.white),
          Container(
            margin: EdgeInsets.only(left: 5.0, right: 5.0),
            decoration: BoxDecoration(
                color: Colorss.textColor1,
                borderRadius: BorderRadius.circular(5)),
            height: MediaQuery.of(context).size.height / 13.0,
            width: MediaQuery.of(context).size.width / 1.0,
            child: CheckboxListTile(
                onChanged: (value) {
                  iconall = value!;
                  setState(() {
                    if (iconall != false) {
                      icon = iconall;
                    }
                    if (iconall != false) {
                      icon1 = iconall;
                    }
                    if (iconall != false) {
                      icon2 = iconall;
                    }
                    if (iconall != false) {
                      icon3 = iconall;
                    }
                    if (iconall != false) {
                      icon4 = iconall;
                      next();
                    } else {
                      null;
                    }
                  });
                },
                title: Text(
                  '전체 동의',
                  style: TextStyle(color: Colors.black),
                ),
                value: iconall,
                selected: iconall,
                checkColor: Colors.white),
          ),
        ],
      ),
    );
  }

  Future<void> next() async {
    setState(() {
      Future.delayed(
          Duration(seconds: 1),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Procedure2())));
    });
  }
}
