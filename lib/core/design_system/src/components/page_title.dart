import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final CrossAxisAlignment crossAxisAlignment;
  final Alignment alignment;
  const PageTitle(
      {super.key,
      required this.title,
      required this.crossAxisAlignment,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Align(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            title,
            style:  GoogleFonts.montserrat(
              color: theme.colors.textColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 5,
            width: 100,
            color: theme.colors.textColor,
          )
        ],
      ),
    );
  }
}
