import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/%20Procedure/procedure3.dart';
import 'package:flutter_01/Model/UserModel.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/Man_page.dart';
import 'package:flutter_01/screens/OpenPage.dart';
import 'package:flutter_01/screens/Woman_page.dart';

class Procedure2 extends StatefulWidget {
  const Procedure2({Key? key}) : super(key: key);

  @override
  _Procedure2State createState() => _Procedure2State();
}

class _Procedure2State extends State<Procedure2> {
  TextEditingController _controllerename = TextEditingController();
  TextEditingController _controlleremail = TextEditingController();
  TextEditingController _controllerHeight = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _womanbox = false;
  bool _manbox = false;
  String _gender = '';
  String _man = '남성';
  String _woman = '여성';

  String username = '';

  void genderWoman() {
    _gender = _woman;
    if (!_manbox) {
      _womanbox = !_womanbox;
    }
    if (_manbox) {
      _manbox = !_manbox;
    }
    if (!_womanbox) {
      _womanbox = !_womanbox;
    }
  }

  void genderman() {
    _gender = _man;
    if (!_womanbox) {
      _manbox = !_manbox;
    }
    if (_womanbox) {
      _womanbox = !_womanbox;
    }
    if (!_manbox) {
      _manbox = !_manbox;
    }
  }

  String _setaddress = '서울';
  String _setsmokings = '가끔';
  String _setreligion = '무교';
  num _setheight = 140;

  final List<String> _datebirth = ['서울', '경기', '부산'];
  final List<String> _smokings = ['비흡연', '술 마실 떄만', '가끔', '아이코스', '전자 담배'];
  final List<String> _religion = ['무교', '기독교', '불교', '천주교', '원불교', '기타'];

  UserModel models = UserModel();

  Future<void> userInfor() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    models.uid = FirebaseAuth.instance.currentUser!.uid;
    models.name = _controllerename.text;
    models.gender = _gender;
    models.address = _setaddress;
    models.smoking = _setsmokings;
    models.religion = _setreligion;

    await firebaseFirestore
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      '이름': models.name,
      '나이': models.age,
      '성별': models.gender,
      '키': models.height,
      '거주지': models.address,
      '흡연여부': models.smoking,
      '종교': models.religion,
    });

    // if (_gender == _man) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => ManPage()));
    // } else {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => WomanPage()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        userdate();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 30.0,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: const Text(
                      '체크 및 작성해주세요.',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: const Text(
                      '변경이 불가하니 신중히 입력해주세요.',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  CheckboxListTile(
                    value: _womanbox,
                    onChanged: (value) {
                      _womanbox = value!;
                      setState(() {
                        genderWoman();
                      });
                    },
                    title: Text('여성'),
                    secondary: Icon(Icons.pregnant_woman_rounded),
                    selected: _womanbox,
                  ),
                  CheckboxListTile(
                    value: _manbox,
                    onChanged: (value) {
                      _manbox = value!;
                      setState(() {
                        genderman();
                      });
                    },
                    title: Text('남성'),
                    secondary: Icon(Icons.person),
                    selected: _manbox,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(Icons.account_circle_outlined,
                                size: 30.0, color: Colorss.indexColor),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 50.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: TextFormField(
                              key: ValueKey(1),
                              decoration: InputDecoration(
                                  helperText: 'ex) 꼬북이',
                                  hintText: '닉네임을 입력해주세요.',
                                  hintStyle: TextStyle(fontSize: 13.0)),
                              validator: (name) {
                                if (name!.isEmpty) {
                                  return '닉네임을 입력해주세요.';
                                }
                                if (name.length > 10) {
                                  return '10자리까지 가능합니다.';
                                }
                              },
                              keyboardType: TextInputType.text,
                              onSaved: (value) {
                                username = value!;
                              },
                              onChanged: (value) {
                                username = value;
                              },
                              textInputAction: TextInputAction.next,
                              controller: _controllerename,
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(Icons.account_circle_outlined,
                                size: 30.0, color: Colorss.indexColor),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 50.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: TextFormField(
                              maxLength: 3,
                              decoration: InputDecoration(
                                  helperText: 'ex) 165',
                                  hintText: '키',
                                  hintStyle: TextStyle(fontSize: 13.0)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '키 입력해주세요.';
                                }
                              },
                              keyboardType: TextInputType.number,
                              onSaved: (value) {
                                username = value!;
                              },
                              onChanged: (value) {
                                username = value;
                              },
                              textInputAction: TextInputAction.next,
                              controller: _controllerHeight,
                            ),
                          ),
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        '활동지역',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.0,
                      ),
                      DropdownButton(
                        value: _setaddress,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colorss.indexColor,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _setaddress = newValue!;
                          });
                        },
                        items: _datebirth
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 22.0),
                        child: const Text(
                          '흡연여부',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: DropdownButton(
                          value: _setsmokings,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colorss.indexColor,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _setsmokings = newValue!;
                            });
                          },
                          items: _smokings
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: const Text(
                          '종교',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: DropdownButton(
                          value: _setreligion,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colorss.indexColor,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _setreligion = newValue!;
                            });
                          },
                          items: _religion
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10.0,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.05,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            userInfor();
                            singup();
                          });
                        },
                        child: const Text(
                          '다음',
                          style: TextStyle(color: Colors.white),
                        ),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void singup() {
    final isValid2 = _formKey.currentState!.validate();
    if (isValid2) {
      setState(() {
        _formKey.currentState!.save();
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => (Procedure3())));
      });
    }
  }

  void userdate() {
    showDialog(
        context: context,
        barrierDismissible: true, // 바탕화면 누르면 안내창 사라짐
        builder: (BuildContext context) {
          return AlertDialog(
              title: FittedBox(child: Text("시작화면으로 돌아가시겠습니까?")),
              actions: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextButton(
                              child: const Text(
                                "계속하기",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              })),
                      Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextButton(
                              child: const Text(
                                "나가기",
                                style: TextStyle(
                                    color: Colorss.indexColor, fontSize: 14),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (OpenPage())));
                              })),
                    ]),
              ]);
        });
  }
}
