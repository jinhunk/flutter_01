import 'package:flutter/material.dart';

class ChatW extends StatelessWidget {
  ChatW({
    required this.id,
    required this.flag,
    required this.Send,
    required this.SendNext,
    required this.SendNo,
    Key? key,
  }) : super(key: key);

  final String id;
  final String flag;
  final String Send;
  final String SendNext;
  final String SendNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          onTap: () {},
          title: Text(
            id,
            style: const TextStyle(color: Colors.black),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/${flag}'),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  SendNo,
                  style: const TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 115, 185, 241)),
              ),
              const SizedBox(
                width: 10.0,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  SendNext,
                  style: const TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 115, 185, 241)),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
