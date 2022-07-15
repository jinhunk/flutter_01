import 'package:flutter/material.dart';

class profilecertification extends StatelessWidget {
  const profilecertification({Key? key}) : super(key: key);

  Widget _bodyheader() {
    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                ' 학교/직장 메일 인증으로\n프로필 신뢰도를 높이세요.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                '친구들과 연결될 확률이 32% 높아집니다.',
                style: TextStyle(color: Colors.black, fontSize: 17.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottombutton(BuildContext context, String title, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.2,
          height: MediaQuery.of(context).size.height / 4.5,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 30, 137, 224)),
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Icon(
                  Icons.school_outlined,
                  size: 50.0,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  description,
                  style: TextStyle(color: Color.fromARGB(255, 187, 183, 183)),
                )
              ],
            ),
          ),
        ),
      ],
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
          '프로필 인증',
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
      body: Column(
        children: [
          _bodyheader(),
          SizedBox(
            height: 70.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bottombutton(context, '학교 인증하기', '보너스 젤리 4개'),
              SizedBox(
                width: 10.0,
              ),
              bottombutton(context, '직장 인증하기', '보너스 젤리 4개'),
            ],
          ),
          SizedBox(
            height: 220.0,
          ),
          Text(
            '메일 주소는 인증 목적으로 사용되며 \n       절대 공개되지 않습니다.',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
