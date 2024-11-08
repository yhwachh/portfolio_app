import 'package:flutter/material.dart';

class ProfileComponents extends StatelessWidget {
  final String title;
  final String description;
  final String urlImage;
  const ProfileComponents({
    super.key,
    required this.title,
    required this.description,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 800),
      child: Row(children: [
        ClipOval(
          child: Image.asset(
            urlImage,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 26),
        Builder(builder: (context) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                Text(description)
              ],
            ),
          );
        })
      ]),
    );
  }
}
