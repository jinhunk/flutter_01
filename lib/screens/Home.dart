import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/screens/Homenext.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void main() {
    String email = "qwe123@gmail.com" +
        "123qwe@naver.com" +
        "q1.w2.e3@daum.net" +
        "_q2_we@nate.com";
    bool isValid = EmailValidator.validate(email);
  } // 이메일 검사

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controlleremail = TextEditingController();
  TextEditingController _controllerpassword = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeNext()));
      snackBar();
    }
  } // 최종로그인

  void snackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.purple,
        content: Text('환영합니다!',
            style: TextStyle(color: Colors.white, fontSize: 18.0))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('로그인'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(Icons.ac_unit),
          )
        ],
      ),
      drawer: Drawer(),
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _controlleremail,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: '아이디', helperText: "이메일형식@gmail.com"),
                    validator: (email) {
                      if (email!.isEmpty) {
                        return '이메일을 입력해주세요';
                      } else {
                        return EmailValidator.validate(email) != email.isEmpty
                            ? null
                            : "공백없이 올바른 이메일 형식을 입력해주세요.";
                      }
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: TextFormField(
                      controller: _controllerpassword,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          hintText: '비밀번호',
                          helperText: '영문, 숫자, 특수문자 포함 최소 6자입니다'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "비밀번호를 입력해주세요";
                        } else {
                          return value.length > 5
                              ? null
                              : "비밀번호는 영문, 숫자, 특수문자 포함 최소 6자입니다";
                        }
                      },
                    )),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                  onPressed: () {
                    setState(() {
                      // _login();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeNext()));
                    });
                  },
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
