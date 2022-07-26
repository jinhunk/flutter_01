// import 'package:flutter/material.dart';
// import 'package:flutter_01/confing/Colors.dart';
// import 'package:flutter_01/screens/OpenPage.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// class Onboarding extends StatelessWidget {
//   const Onboarding({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IntroductionScreen(
//       pages: [
//         PageViewModel(
//           title: 'Welcome to my app',
//           body: 'This is the first Page',
//           image: Image.asset('images/김유정.jpg'),
//           decoration: getPageDecoration(),
//         ),
//         PageViewModel(
//           title: 'Welcome to my app',
//           body: 'This is the 2번 Page',
//           image: Image.asset('images/박민영.jpg'),
//           decoration: getPageDecoration(),
//         ),
//         PageViewModel(
//           title: 'Welcome to my app',
//           body: 'This is the 3번 Page',
//           decoration: getPageDecoration(),
//         ),
//       ],
//       showDoneButton: false,
//       done: const Text('다음'),
//       onDone: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const OpenPage()),
//         );
//       },
//       showNextButton: false,
//       next: const Icon(Icons.arrow_forward),
//       showSkipButton: false,
//       skip: const Text('skip'),
//       dotsDecorator: DotsDecorator(
//           color: Colors.cyan,
//           size: const Size(10, 10),
//           activeSize: const Size(22, 10),
//           activeShape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24),
//           ),
//           activeColor: Colorss.indexColor),
//       curve: Curves.bounceOut,
//     );
//   }

//   PageDecoration getPageDecoration() {
//     return PageDecoration(
//         titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//         bodyTextStyle: TextStyle(fontSize: 18, color: Colorss.indexColor),
//         imagePadding: EdgeInsets.only(top: 40),
//         pageColor: Colors.orange);
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class Ondoarding extends StatelessWidget {
  const Ondoarding({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image slider 데모')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(),
        items: imgList
            .map((item) => Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Image.network(item, fit: BoxFit.cover, width: 1000),
                  ),
                ))
            .toList(),
      )),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
