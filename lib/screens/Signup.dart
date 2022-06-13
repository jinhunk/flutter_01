import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/%20Procedure/%20procedure1.dart';

import 'package:flutter_01/Model/UserModel.dart';
import 'package:flutter_01/confing/Colors.dart';

import 'package:image_picker/image_picker.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  void ttt() {
    String email = "qwe123@gmail.com" +
        "123qwe@naver.com" +
        "q1.w2.e3@daum.net" +
        "_q2_we@nate.com";
    bool isValid = EmailValidator.validate(email);
  }

  final _formKey2 = GlobalKey<FormState>();

  TextEditingController _controlleremail = TextEditingController();
  TextEditingController _controllerage = TextEditingController();
  TextEditingController _controllerpassword = TextEditingController();
  TextEditingController _controllerpassword2 = TextEditingController();

  final _auth = FirebaseAuth.instance; // 파이어베이스 인증코드(중요)
  String username = '';
  String useremail = '';
  String userpassword = '';
  String userNumber = '';
  bool showspinner = false; // ModalProgressHUD

  final Text _pwd = Text('동일합니다,', style: TextStyle(color: Colors.blue));

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.only(top: 10.0),
            width: 150,
            height: 300,
            child: Column(
              children: [
                CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    backgroundImage:
                        pickedImage != null ? FileImage(pickedImage!) : null),
                const SizedBox(
                  height: 10.0,
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    _pickImage();
                  },
                  icon: const Icon(Icons.image),
                  label: const Text('추가'),
                ),
                const SizedBox(
                  height: 80.0,
                ),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    label: const Text('닫기'))
              ],
            ),
          ),
        );
      },
    );
  }

  //이미지 얼렛창s

  File? pickedImage;
  void _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImageFile = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50, maxHeight: 150);
    setState(() {
      if (pickedImageFile != null) {
        pickedImage = File(pickedImageFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colorss.indexColor,
        centerTitle: true,
        title: const Text(
          '회원가입',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10.0),
          child: Form(
            key: _formKey2,
            child: Column(
              children: [
                ClipOval(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/설레는.gif'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30.0,
                ),
                // GestureDetector(
                //   onTap: () {
                //     showAlert(context);
                //   },
                //   child: Icon(
                //     Icons.image,
                //     color: Colorss.indexColor,
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 11.0),
                          child: Icon(Icons.email_outlined,
                              size: 30.0, color: Colorss.indexColor),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50.0,
                        ),
                        Container(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: TextFormField(
                              key: ValueKey(2),
                              decoration: InputDecoration(
                                  hintText: '이메일을 입력해주세요.',
                                  helperText: "이메일형식@gmail.com",
                                  hintStyle: TextStyle(fontSize: 13.0)),
                              validator: (email) {
                                if (email!.isEmpty) {
                                  return '이메일을 입력해주세요';
                                } else {
                                  return EmailValidator.validate(email) ==
                                          email.isEmpty
                                      ? "공백없이 올바른 이메일 형식을 입력해주세요."
                                      : null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) {
                                useremail = value!;
                              },
                              onChanged: (value) {
                                useremail = value;
                              },
                              textInputAction: TextInputAction.next,
                            ),
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
                          padding: const EdgeInsets.only(top: 11.0),
                          child: Icon(Icons.lock,
                              size: 30.0, color: Colorss.indexColor),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            key: ValueKey(3),
                            decoration: InputDecoration(
                                hintText: '비밀번호를 입력해주세요.',
                                helperText: '영문, 숫자, 특수문자 포함 최소 6자입니다',
                                hintStyle: TextStyle(fontSize: 13.0)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '비밀번호를 입력해주세요';
                              } else if (value.length < 6) {
                                return '비밀번호 6자리 이상 입력해주세요.';
                              }
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            onSaved: (value) {
                              userpassword = value!;
                            },
                            onChanged: (value) {
                              userpassword = value;
                            },
                            controller: _controllerpassword,
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
                          padding: const EdgeInsets.only(top: 11.0),
                          child: Icon(Icons.lock,
                              size: 30.0, color: Colorss.indexColor),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            key: ValueKey(3),
                            decoration: InputDecoration(
                                hintText: '비밀번호 확인',
                                helperText: '위 비밀번호랑 동일하게 입력해주세요.',
                                hintStyle: TextStyle(fontSize: 13.0)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '위 비밀번호와 동일하게 입력해주세요.';
                              } else if (_controllerpassword.text.length ==
                                  _controllerpassword2.text.length) {
                                return '동일합니다';
                              } else {
                                return '비밀번호가 같지 않습니다.';
                              }
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            onSaved: (value) {
                              userpassword = value!;
                            },
                            onChanged: (value) {
                              userpassword = value;
                            },
                            controller: _controllerpassword2,
                          ),
                        ),
                      ]),
                ),
                // FlutterPwValidator(
                //   controller: _controllerpassword,
                //   minLength: 8,
                //   width: MediaQuery.of(context).size.width / 1.3,
                //   height: 50,
                //   onSuccess: () {},
                //   // successColor: Colors.blue,
                // ),
                SizedBox(
                  height: 30.0,
                ),
                Column(
                  children: [
                    Container(
                      child: TextButton(
                        style:
                            TextButton.styleFrom(primary: Colorss.indexColor),
                        onPressed: () {
                          setState(() {
                            singup();
                          });
                          _isSignupScreen();
                        },
                        child: Text('가입하기'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void singup() {
    final isValid2 = _formKey2.currentState!.validate();
    if (isValid2) {
      _formKey2.currentState!.save();
    }
  } //가입하기 버튼 최종

  Future<void> _isSignupScreen() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: useremail, password: userpassword);

      setState(() {
        userInfor();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => (Procedure1())));
      });

      // if (newUser.user != null) {
      //   // Navigator.push(
      //   //     context, MaterialPageRoute(builder: (context) => (ChatScreen())));
      //   // setState(() {
      //   //   showspinner = false;
      //   // });
      //

    } catch (e) {
      print('에러가 발생했습니다.');
    }
  } //파이어베이스 가입연동

  UserModel models = UserModel();
  Future<void> userInfor() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    models.uid = FirebaseAuth.instance.currentUser!.uid;
    models.email = FirebaseAuth.instance.currentUser!.email;

    await firebaseFirestore
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(models.toMap());

    // models.age = "${selectedDate.toLocal()}".split('')[0];
  }
}
