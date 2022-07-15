import 'package:flutter/material.dart';

class Animal extends StatefulWidget {
  const Animal({Key? key}) : super(key: key);

  @override
  _AnimalState createState() => _AnimalState();
}

class _AnimalState extends State<Animal> {
  Widget _bodyheader() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                '반려동물 사진을 등록해서\n  친구들에게 자랑하세요!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '내 프로필 상세에 반영되며 ',
                style: TextStyle(fontSize: 17.0),
              ),
              Text(
                '더 많은 친구들에게 호감을 받을 수 있습니다.',
                style: TextStyle(fontSize: 17.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bodyimage() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.0),
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 7.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Color.fromARGB(255, 247, 215, 226),
      ),
      child: Icon(
        Icons.add,
        color: Colors.pink,
        size: 40.0,
      ),
    );
  }

  Widget bodybottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  '반려동물이랑 같이 찍은 사진',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  width: 2.0,
                ),
                Icon(
                  Icons.check_circle,
                  color: Colors.amber,
                  size: 17.0,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '반려동물만 같이 멋진 사진',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  width: 2.0,
                ),
                Icon(
                  Icons.check_circle,
                  color: Colors.amber,
                  size: 17.0,
                ),
              ],
            ),
            Text(
              '반려동물과 관련 없는 사진일 경우 거절될 수 있습니다.',
              style: TextStyle(color: Colors.black),
            ),
          ],
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
          '반려동물 등록',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 13.0, right: 20.0),
            child: Text(
              '저장',
              style: TextStyle(color: Colors.pink, fontSize: 17.0),
            ),
          ),
        ],
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
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_bodyimage(), _bodyimage(), _bodyimage()],
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_bodyimage(), _bodyimage(), _bodyimage()],
          ),
          SizedBox(
            height: 70.0,
          ),
          bodybottom()
        ],
      ),
    );
  }
}
