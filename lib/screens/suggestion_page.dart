import 'package:flutter/material.dart';

class SuggestionPage extends StatelessWidget {
  final String userId;
  final String description;
  const SuggestionPage(
      {Key? key, required this.userId, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width / 1.10,
      height: MediaQuery.of(context).size.height / 2.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black12),
        image: DecorationImage(
          image: AssetImage('images/박민영.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 300,
            child: Column(
              children: [
                Text(
                  userId,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 310.0,
            top: 12.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.pink),
              width: MediaQuery.of(context).size.width / 13.0,
              height: MediaQuery.of(context).size.height / 45.0,
              child: Text(
                'N',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.symmetric(vertical: 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
