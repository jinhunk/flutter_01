import 'package:flutter/material.dart';
import 'package:flutter_01/confing/Colors.dart';
import 'package:flutter_01/screens/Woman/suggestionPage.dart';

class HomeW extends StatefulWidget {
  const HomeW({Key? key}) : super(key: key);

  @override
  _HomeWState createState() => _HomeWState();
}

class _HomeWState extends State<HomeW> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(right: 222.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                TabBar(
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colorss.indexColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Text(
                        '추천',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        '라운지',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.access_alarm,
                color: Colorss.indexColor,
              ),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            SuggestionPage(),
            Icon(Icons.ac_unit_outlined),
          ],
        ),
      ),
    );
  }
}