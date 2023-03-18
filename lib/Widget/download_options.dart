import 'package:flutter/material.dart';

class DownloadOptions extends StatelessWidget {
  DownloadOptions({super.key, required this.optionName});

  String optionName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 125,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          const Icon(
            Icons.download,
            color: Colors.green,
          ),
          Text(
            optionName,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
