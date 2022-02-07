import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/screens/Homepage.dart';
import 'package:flutter_01/screens/OpenPage.dart';

class Open extends StatefulWidget {
  const Open({Key? key}) : super(key: key);

  @override
  _OpenState createState() => _OpenState();
}

class _OpenState extends State<Open> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> user) {
          if (user.data == null) {
            return OpenPage();
          } else {
            return HomePage();
          }
        });
  }
}
