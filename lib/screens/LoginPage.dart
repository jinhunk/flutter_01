import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/Model/UserModel.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/Chat_Screen.dart';
import 'package:flutter_01/screens/Homepage.dart';
import 'package:flutter_01/screens/Signup.dart';
import 'package:flutter_01/screens/Woman/HomeW.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void sss() {
    String email = "qwe123@gmail.com" +
        "123qwe@naver.com" +
        "q1.w2.e3@daum.net" +
        "_q2_we@nate.com";
    bool isValid = EmailValidator.validate(email);
  } // 이메일 검사

  final _formKey = GlobalKey<FormState>();
  TextEditingController _controlleremail = TextEditingController();
  TextEditingController _controllerpassword = TextEditingController();

  void _login() {
    final isValid2 = _formKey.currentState!.validate();
    if (isValid2) {
      _formKey.currentState!.save();
    }
  } // 최종로그인

  void snackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.purple,
        content: const Text('환영합니다!',
            style: TextStyle(color: Colors.white, fontSize: 18.0)),
      ),
    );
  }

  final _auth = FirebaseAuth.instance;
  String useremail = '';
  String userpassword = '';

  bool showspinner = false; // ModalProgressHUD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colorss.indexColor,
        centerTitle: true,
        title: const Text(
          '로그인',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Image.network(
                      'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201901/20/28017477-0365-4a43-b546-008b603da621.jpg',
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Icon(Icons.email_outlined,
                            size: 30.0, color: Colorss.indexColor),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 50.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          controller: _controlleremail,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              hintText: '아이디',
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
                          onChanged: (value) {
                            useremail = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Icon(Icons.lock,
                            size: 30.0, color: Colorss.indexColor),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 50.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          controller: _controllerpassword,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              hintText: '비밀번호',
                              helperText: '영문, 숫자, 특수문자 포함 최소 6자입니다',
                              hintStyle: TextStyle(fontSize: 13.0)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "비밀번호를 입력해주세요";
                            } else {
                              return value.length > 5
                                  ? null
                                  : "비밀번호는 영문, 숫자, 특수문자 포함 최소 6자입니다";
                            }
                          },
                          onChanged: (value) {
                            userpassword = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 9.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: const Text(
                        '회원가입',
                        style: TextStyle(color: Colorss.indexColor),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showspinner = true;
                        });
                        _isLoginScreen();
                        _login();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: const Text(
                        '로그인',
                        style: TextStyle(
                          color: Colorss.indexColor,
                          letterSpacing: 1.0,
                        ),
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

  Future<void> _isLoginScreen() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: useremail,
        password: userpassword,
      );
      setState(() {
        userInfor();
      });
    } catch (e) {
      print(e);
    }
  } //파이어베이스 로그인 연동

  UserModel models = UserModel();
  void userInfor() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    firebaseFirestore
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      this.models = UserModel.fromMap(value.data());
    });
  } // 모델관리()
}
