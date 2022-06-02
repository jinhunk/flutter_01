import 'package:flutter/material.dart';
import 'package:flutter_01/screens/Woman/Chat.dart';
import 'package:flutter_01/screens/Woman/FriendWdata.dart';

class FriendW extends StatefulWidget {
  const FriendW({Key? key}) : super(key: key);

  @override
  _FriendWState createState() => _FriendWState();
}

class _FriendWState extends State<FriendW> {
  List<Worlddata> Lists = [
    Worlddata(
      id: '김유정',
      url: '',
      flag: '김유정.jpg',
      Send: '보내기',
      SendNext: '수락',
      SendNo: '거절',
    ),
    Worlddata(
      id: '박민영',
      url: '',
      flag: '박민영.jpg',
      Send: '보내기',
      SendNext: '수락',
      SendNo: '거절',
    ),
    Worlddata(
      id: '장민지',
      url: '',
      flag: 'dice1.jpg',
      Send: '보내기',
      SendNext: '수락',
      SendNo: '거절',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: Lists.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(Lists[index].id),
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/${Lists[index].flag}'),
              ),
              trailing: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatW(
                        id: Lists[index].id,
                        flag: Lists[index].flag,
                        Send: Lists[index].Send,
                        SendNext: Lists[index].SendNext,
                        SendNo: Lists[index].SendNo,
                      ),
                    ),
                  );
                },
                child: Text(
                  Lists[index].Send,
                  style: const TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 115, 185, 241)),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class FriendWW extends StatefulWidget {
//   const FriendWW({Key? key}) : super(key: key);

//   @override
//   _FriendWWState createState() => _FriendWWState();
// }

// class _FriendWWState extends State<FriendWW> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             color: Color.fromARGB(255, 189, 227, 245),
//             child: Row(
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(top: 10.0, left: 20.0),
//                   width: MediaQuery.of(context).size.width / 4.0,
//                   child: ClipOval(
//                     child: Image.asset(
//                       'images/김유정.jpg',
//                     ),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20.0, top: 10.0),
//                       child: const Text(
//                         '김유정',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18.0),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5.0,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: Text('메세제를 보내세요.'),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   width: 80,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0, top: 10.0),
//                   child: TextButton(
//                     onPressed: () {
//                       // Navigator.push(context,
//                       //     MaterialPageRoute(builder: (context) => ChatW()));
//                     },
//                     child: Text(
//                       '보내기',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     style: TextButton.styleFrom(backgroundColor: Colors.blue),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             color: Color.fromARGB(255, 189, 189, 189),
//             width: MediaQuery.of(context).size.width / 1.0,
//             height: MediaQuery.of(context).size.height / 600.0,
//           ),
//         ],
//       ),
//     );
//   }
// }
