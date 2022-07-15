import 'package:flutter/material.dart';

class profiletop extends StatelessWidget {
  const profiletop({Key? key}) : super(key: key);

  Widget _bodytop() {
    return Padding(
      padding: const EdgeInsets.only(top: 65.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                '           위피에서 만난\n소중한 인연을 소개해주세요!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '우수 사연으로 채택되신 분들께 시그니엘',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '서울 호텔 숙박권을 선물해드립니다.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bodybuttonone(
    BuildContext context,
    String title,
    String description,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.2,
          height: MediaQuery.of(context).size.height / 6.5,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 87, 107, 219).withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 87, 107, 219)),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Icon(
                  Icons.handshake,
                  size: 30.0,
                  color: Colors.amber,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                            color: Color.fromARGB(255, 187, 183, 183)),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bodybuttontwo(
    BuildContext context,
    String title,
    String description,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.2,
          height: MediaQuery.of(context).size.height / 6.5,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 255, 122, 167)),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Icon(
                  Icons.favorite,
                  size: 30.0,
                  color: Colors.amber,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                            color: Color.fromARGB(255, 187, 183, 183)),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
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
          '사연 보내기',
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
            height: 80.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _bodybuttonone(context, '우리 친구 됐어요', '사연보내기'),
              SizedBox(
                width: 10.0,
              ),
              _bodybuttontwo(context, '우리 커플 됐어요', '사연보내기'),
            ],
          ),
          SizedBox(
            height: 180.0,
          ),
          Text(
            '자세한 내용은 사연 보내기 버튼을 통해 확인하세요.',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
