import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/jelly.dart';
import 'dart:math' as math;

class Pick extends StatefulWidget {
  const Pick({Key? key}) : super(key: key);

  @override
  _PickState createState() => _PickState();
}

class _PickState extends State<Pick> {
  int _current = 0;
  GlobalKey<CarouselSliderState> _sliderKey = GlobalKey();

  final List<String> imgList = [
    'https://cdnweb01.wikitree.co.kr/webdata/editor/202110/06/img_20211006130837_bdb87ae2.webp',
    'https://file.mk.co.kr/meet/neds/2021/11/image_readtop_2021_1064668_16365912194846327.jpg',
    'http://image.ajunews.com//content/image/2021/10/06/20211006192052344089.jpg',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  } //애니메이션

  Widget _body() {
    return Column(
      children: [
        CarouselSlider.builder(
          key: _sliderKey,
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            if (index == 0) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      imgList[index],
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height / 1.6,
                    ),
                  ),
                  Positioned(
                    top: 445.0,
                    left: 15.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이정재, 29',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 4.5,
                              height: MediaQuery.of(context).size.height / 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 20.0,
                                      color: Color.fromARGB(255, 248, 244, 244),
                                    ),
                                    Text(
                                      '12km',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4.5,
                              height: MediaQuery.of(context).size.height / 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(color: Colors.white)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.mic,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Text(
                                      '목소리',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  imgList[index],
                  fit: BoxFit.fill,
                ),
              );
            }
          },
          options: CarouselOptions(
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            autoPlay: true,
            scrollDirection: Axis.horizontal,
            reverse: false,
            height: MediaQuery.of(context).size.height / 1.6,
            onPageChanged: (index, int) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(
            imgList,
            (index, url) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.pink : Colors.grey),
              );
            },
          ),
        ),
      ],
    );
  }
  // return Padding(
  //   padding: const EdgeInsets.only(top: 5.0),
  //   child: Container(
  //     width: MediaQuery.of(context).size.width / 1.1,
  //     height: MediaQuery.of(context).size.height / 1.6,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),
  //       color: Colors.amber,
  //       // image: DecorationImage(
  //       //   image: NetworkImage(
  //       //       'https://cdnweb01.wikitree.co.kr/webdata/editor/202110/06/img_20211006130837_bdb87ae2.webp'),
  //       //   fit: BoxFit.cover,
  //       // ),
  //     ),

  // child: Stack(
  //   children: [
  //     Positioned(
  //       top: 445.0,
  //       left: 15.0,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             '이정재, 29',
  //             style: TextStyle(color: Colors.white, fontSize: 25.0),
  //           ),
  //           SizedBox(
  //             height: 5.0,
  //           ),
  //           Row(
  //             children: [
  //               Container(
  //                 width: MediaQuery.of(context).size.width / 4.5,
  //                 height: MediaQuery.of(context).size.height / 30,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(2),
  //                   border: Border.all(color: Colors.white),
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(left: 5.0),
  //                   child: Row(
  //                     children: [
  //                       Icon(
  //                         Icons.location_on_outlined,
  //                         size: 20.0,
  //                         color: Color.fromARGB(255, 248, 244, 244),
  //                       ),
  //                       Text(
  //                         '12km',
  //                         style: TextStyle(
  //                             color: Colors.white, fontSize: 18.0),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: 5.0,
  //               ),
  //               Container(
  //                 width: MediaQuery.of(context).size.width / 4.5,
  //                 height: MediaQuery.of(context).size.height / 30,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(2),
  //                     border: Border.all(color: Colors.white)),
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(left: 5.0),
  //                   child: Row(
  //                     children: [
  //                       Icon(
  //                         Icons.mic,
  //                         color: Colors.white,
  //                         size: 20.0,
  //                       ),
  //                       SizedBox(
  //                         width: 3.0,
  //                       ),
  //                       Text(
  //                         '목소리',
  //                         style: TextStyle(
  //                             color: Colors.white, fontSize: 18.0),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   ],
  // ),
  //     ),
  //   );
  // }

  Widget _bodybutton() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 15.0),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.3,
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 10.0,
                offset: Offset(0, 5),
              ),
            ], borderRadius: BorderRadius.circular(30.0), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                '별로예요',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.3,
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 48, 207, 170).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(30.0),
              color: Color.fromARGB(255, 48, 207, 170),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                '괜찮아요',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Text(
            '위픽',
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Transform.rotate(
              angle: -20 * math.pi / 180,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (Jelly())));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  padding: EdgeInsets.only(top: 2.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 235, 229, 229),
                          Colorss.indexColor,
                        ]),
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.0),
                        topRight: Radius.circular(7.0),
                        bottomLeft: Radius.circular(11.0),
                        bottomRight: Radius.circular(11.0)),
                  ),
                  width: MediaQuery.of(context).size.width / 10.0,
                  child: Text(
                    'Jelly',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _body(),
          SizedBox(
            height: 3.0,
          ),
          _bodybutton(),
        ],
      ),
    );
  }
}
