// import 'package:flutter/material.dart';
// import 'package:flutter_01/screens/Homepage.dart';


// class ShoppingScreen extends StatelessWidget {
//   const ShoppingScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // iOS에서 StatusBar의 색상을 정해주기위해 설정
//     // TabBar 등을 사용하려면 Scaffold 혹은 Meterial로 감싸줘야함.
//     return Material(
//       color: Colors.white,
//       child: SafeArea(
//         child: DefaultTabController(
//           length: 3,
//           child: NestedScrollView(
//             headerSliverBuilder: (context, innerBoxIsScrolled) {
//               return [
//                 const SliverAppBar(
//                   pinned: false,
//                   backgroundColor: Colors.white,
//                   title: Text(
//                     "Flutter Shopping App",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//                  SliverPersistentHeader(
//                     pinned: true, delegate: TabBarDelegate()),
//               ];
//             },
//             body: TabBarView(
//               children: [
//                 CustomScrollView(
//                   slivers: [
//                     SliverToBoxAdapter(
//                       child: Container(
//                         height: 400,
//                         color: Colors.grey,
//                       ),
//                     ),
//                      SliverPersistentHeader(
//                         pinned: true, delegate: HomePage()),
//                     SliverList(
//                         delegate: SliverChildBuilderDelegate(
//                             (context, index) => Container(
//                                   height: 40,
//                                   // 보는 재미를 위해 인덱스에 아무 숫자나 곱한 뒤 255로
//                                   // 나눠 다른 색이 보이도록 함.
//                                   color: Color.fromRGBO((index * 45) % 255,
//                                       (index * 70) % 255, (index * 25), 1.0),
//                                 ),
//                             childCount: 40))
//                   ],
//                 ),
//                 Container(
//                   color: Colors.redAccent,
//                 ),
//                 Container(
//                   color: Colors.blue,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }