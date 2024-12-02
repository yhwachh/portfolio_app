import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      padding: const EdgeInsets.all(16.0),
      width: 374,
      constraints: BoxConstraints(minHeight: 400),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colors.borderColor,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 2,
            height: 400,
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
                    style:  GoogleFonts.montserrat(
                      color: theme.colors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 16),
                Text(
                    style:  GoogleFonts.montserrat(color: theme.colors.textColor),
                    experiences),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
