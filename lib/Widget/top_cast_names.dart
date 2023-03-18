import 'package:flutter/material.dart';

class TopCastNames extends StatelessWidget {
  TopCastNames({super.key, required this.name, required this.subName});

  String name;
  String subName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: name, style: TextStyle(color: Colors.grey)),
              TextSpan(text: subName, style: TextStyle(color: Colors.white)),
            ],
          ),
        )
      ],
    );
  }
}
