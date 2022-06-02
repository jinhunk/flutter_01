import 'package:flutter/material.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/OpenPage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the first Page',
          image: Image.asset('images/김유정.jpg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the 2번 Page',
          image: Image.asset('images/박민영.jpg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the 3번 Page',
          decoration: getPageDecoration(),
        ),
      ],
      done: const Text('다음'),
      onDone: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OpenPage()),
        );
      },
      next: const Icon(Icons.arrow_forward),
      showSkipButton: true,
      skip: const Text('skip'),
      dotsDecorator: DotsDecorator(
          color: Colors.cyan,
          size: const Size(10, 10),
          activeSize: const Size(22, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          activeColor: Colorss.indexColor),
      curve: Curves.bounceOut,
    );
  }

  PageDecoration getPageDecoration() {
    return PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 18, color: Colorss.indexColor),
        imagePadding: EdgeInsets.only(top: 40),
        pageColor: Colors.orange);
  }
}
