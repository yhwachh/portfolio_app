import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final CrossAxisAlignment crossAxisAlignment;
  const PageTitle(
      {super.key, required this.title, required this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 5,
            width: 100,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
