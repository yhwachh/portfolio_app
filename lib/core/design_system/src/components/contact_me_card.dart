import 'package:flutter/material.dart';

class ContactMeCard extends StatelessWidget {
  final String imagePhath;
  final VoidCallback onTap;
  final double height;
  final double width;
  const ContactMeCard(
      {super.key,
      required this.imagePhath,
      required this.onTap,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imagePhath,
        height: height,
        width: width,
      ),
    );
  }
}
