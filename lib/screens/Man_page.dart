import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ManPage extends StatefulWidget {
  const ManPage({Key? key}) : super(key: key);

  @override
  _ManPageState createState() => _ManPageState();
}

class _ManPageState extends State<ManPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // StreamBuilder(
        //   stream: FirebaseFirestore.instance.collection('imageURLs').snapshots(),
        //   builder: (context, snapshot) {
        //     return !snapshot.hasData
        //         ? Center(
        //             child: CircularProgressIndicator(),
        //           )
        //         : Container(
        //             child: GridView.builder(
        //                 itemCount: snapshot.data!.docs,
        //                 gridDelegate:
        //                     const SliverGridDelegateWithFixedCrossAxisCount(
        //                         crossAxisCount: 3),
        //                 itemBuilder: (context, index) {
        //                   return Container(
        //                     margin: EdgeInsets.all(3),
        //                     child: FadeInImage.memoryNetwork(
        //                         placeholder: kTransparentImage,
        //                         image: snapshot.data()),
        //                   );
        //                 }),
        //           );
        //   },

        );
  }
}
