import 'package:flutter/material.dart';

class ProfileComponent extends StatelessWidget {
  final String title;
  final String description;
  final String urlImage;
  const ProfileComponent({
    super.key,
    required this.title,
    required this.description,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        constraints: BoxConstraints(maxWidth: 800),
        child: Wrap(
            alignment: constraints.maxWidth > 800
                ? WrapAlignment.start
                : WrapAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  urlImage,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Builder(builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    SizedBox(width: 500, child: Text(description))
                  ],
                );
              })
            ]),
      );
    });
  }
}
