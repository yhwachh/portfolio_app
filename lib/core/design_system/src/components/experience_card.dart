import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';

class ExperienceCard extends StatelessWidget {
  final String title;
  final String experiences;
  const ExperienceCard(
      {super.key, required this.title, required this.experiences});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      width: 374,
      height: 257,
      decoration: BoxDecoration(
        border: Border.all(
          color: UIColorData.black.withOpacity(0.25),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 2,
              height: 300,
              color: Colors.grey,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                        color: theme.colors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                      style: TextStyle(color: theme.colors.textColor),
                      experiences),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
