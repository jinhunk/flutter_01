import 'package:flutter/material.dart';

class Voice extends StatelessWidget {
  const Voice({Key? key}) : super(key: key);

  Widget _bodytop() {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                '목소리로 당신의 매력을 어필하세요.',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '목소리는 프로필 신뢰도를 높이고',
                style: TextStyle(fontSize: 17.0),
              ),
              Text(
                '친구들에게 더 많은 호감을 얻을 수 있습니다.',
                style: TextStyle(fontSize: 17.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bodymicbutton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 250, 237, 241),
        borderRadius: BorderRadius.circular(120),
      ),
      child: Icon(
        Icons.mic,
        size: 120.0,
        color: Colors.pink,
      ),
    );
  }

  Widget _bodybottombutton(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 13.0),
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 16.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.pink),
        child: Text(
          '목소리 녹음하기',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black54),
        title: Text(
          '목소리 등록',
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
          _bodytop(),
          SizedBox(
            height: 40.0,
          ),
          _bodymicbutton(context),
          SizedBox(
            height: 120.0,
          ),
          _bodybottombutton(context)
        ],
      ),
    );
  }
}
