import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';

class SkillCard extends StatelessWidget {
  final String urlimage;
  final String title;

  const SkillCard({super.key, required this.title, required this.urlimage});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Column(children: [
      SizedBox(height: 64, width: 64, child: Image.asset(urlimage)),
      SizedBox(
          width: 100,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style:  GoogleFonts.montserrat(
              color: theme.colors.textColor,
            ),
          )),
    ]);
  }
}
