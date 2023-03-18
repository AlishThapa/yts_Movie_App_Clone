
import 'package:flutter/material.dart';

class OptionsFor20p extends StatelessWidget {
  OptionsFor20p({super.key, required this.name, required this.icon});

  String name;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 5),
        Text(
          name,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
      ],
    );
  }
}
