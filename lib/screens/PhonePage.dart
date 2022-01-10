import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/Chat_Screen.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<PhonePage> {
  String selectedCountry = '+82'; //선택된 국가

  String myverificationId = '';

  List<String> country = ['+82'];

  // ignore: unused_field
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _phone = TextEditingController();
  TextEditingController _code = TextEditingController();

  bool showClearIcon = false;

  String getcodeText = "전송";
  bool isSendding = false;
  bool isLoding = false;

  late Timer _codeTimer;

  int start = 100;

  Color _colorss = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorss.indexColor,
        centerTitle: true,
        title: Text('휴대폰 인증 로그인'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Text(
              '본인 인증',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15.0, left: 20.0),
            child: Text(
              '허위/중복가입을 막기위한 절차이며,',
              style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 3.0, left: 20.0),
            child: Text(
              '휴대폰번호는 절대 공개되지 않습니다.',
              style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Form(
            key: _formkey,
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colorss.textColor1,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: [
                            DropdownButton<String>(
                              underline: Container(), // 작대기
                              value: selectedCountry,
                              items: country.map((String e) {
                                return DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCountry = value!;
                                });
                              },
                            ), // 국가코드
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              height: MediaQuery.of(context).size.height / 20.0,
                              width: MediaQuery.of(context).size.width / 200.0,
                              color: Colors.black,
                            ), // 작대기 코드
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    if (value.isEmpty) {
                                      showClearIcon = false;
                                    } else {
                                      showClearIcon = true;
                                    }
                                  }); //클리어아이콘관련
                                },
                                controller: _phone,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '01012345678'),
                                validator: isLoding == false
                                    ? (String? value) {
                                        if (value!.isEmpty) {
                                          return '전화번호를 입력해주세요.';
                                        }
                                        if (_phone.text.length < 11) {
                                          return '전화번호를 제대로 입력해주세요.';
                                        } else {
                                          return null;
                                        }
                                      }
                                    : null,
                              ),
                            ),
                            //클리어 아이콘
                            showClearIcon == false
                                ? Text('')
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _phone.clear();
                                        showClearIcon = false;
                                      });
                                    },
                                    icon: Icon(Icons.close),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colorss.textColor1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextFormField(
                                controller: _code,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '코드번호입력'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          //휴대폰번호전송버튼
                          Expanded(
                            child: GestureDetector(
                              onTap: isSendding == false
                                  ? () {
                                      if (_phone.text.isNotEmpty) {
                                        final String number =
                                            selectedCountry + _phone.text;
                                        print(number);
                                        verifyPhoneNumber(context, number);
                                      }
                                    }
                                  : null,
                              child: Container(
                                padding: EdgeInsets.all(15.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colorss.indexColor,
                                  ),
                                ),
                                child: Text(
                                  '$getcodeText',
                                  style: TextStyle(
                                      color: isSendding == false
                                          ? Colors.red
                                          : Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 코드버튼확인
                    GestureDetector(
                      onTap: isLoding == false
                          ? () {
                              if (_formkey.currentState!.validate()) {}
                              if (_code.text.isNotEmpty) {
                                verifySmsCode(context, _code.text.trim());
                              }
                            }
                          : null,
                      child: Container(
                        alignment: Alignment.center,
                        color: isLoding == false
                            ? Colorss.textColor1
                            : Colorss.indexColor,
                        padding: EdgeInsets.all(15.0),
                        child: isLoding == false
                            ? Text(
                                '확인',
                                style: TextStyle(color: Colors.white),
                              )
                            : Text(
                                '확인중',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> verifyPhoneNumber(BuildContext context, String phone) async {
    num duration = 100; // 60에서 10으로 바꿈

    _codeTimer = Timer.periodic(
        const Duration(
          minutes: 100,
          seconds: 1,
        ), (Timer timer) {
      setState(() {
        isSendding = true;

        if (duration < 100) {
          _codeTimer.cancel();
          isSendding = false;
          getcodeText = '다시전송';
        } else {
          duration--;
          getcodeText = "$duration";
        }
      });
    }); //전송및시간타임,
    FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);

        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => InitializerWidget()));
      },
      timeout: const Duration(seconds: 5), // 60에서 10으로 바꿈
      verificationFailed: (FirebaseException error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colorss.indexColor,
            content: Text(
              '유효하지 않는 번호입니다.',
            ),
          ),
        );
      }, //확인실패
      codeSent: (verificationId, resendingToken) {
        setState(() {
          myverificationId = verificationId;
        }); //코드전송,재전송토큰
      },
      codeAutoRetrievalTimeout: (String verificationId) async {},
      //코드자동검색
    );
  }

  void verifySmsCode(BuildContext context, String code) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    setState(() {
      isLoding = true;
    });
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: myverificationId, smsCode: code);
    await _auth.signInWithCredential(credential);
    setState(() {
      isLoding = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(),
      ),
    );
  }
}
