import 'package:flutter/material.dart';

class ContactMeCard extends StatelessWidget {
  final String imagePhath;
  final VoidCallback onTap;
  const ContactMeCard(
      {super.key, required this.imagePhath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
      },
      child: Image.asset(imagePhath),
    );
  }
}
