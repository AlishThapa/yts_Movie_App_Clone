import 'package:flutter/material.dart';

class MovieReviewWidget extends StatelessWidget {
  const MovieReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Icon(
              Icons.star,
              color: Colors.green,
              size: 30,
            ),
            SizedBox(width: 5),
            Text(
              'Movie Reviews',
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 30),
            )
          ],
        ),
        Row(
          children: const [
            Text(
              'Reviewed by',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(width: 5),
            Icon(Icons.star, color: Colors.green, size: 15),
            Text(
              '/10',
              style: TextStyle(color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
