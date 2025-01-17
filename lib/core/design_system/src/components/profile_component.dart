import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';

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
    final theme = AppTheme.of(context);
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
              SizedBox(width: 30),
              Builder(builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (constraints.maxWidth < 800) SizedBox(height: 20),
                    Text(title,
                        style:  GoogleFonts.montserrat(
                            color: theme.colors.textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    SizedBox(
                        width: 500,
                        child: Text(
                          description,
                          style:  GoogleFonts.montserrat(
                            color: theme.colors.textColor,
                          ),
                        ))
                  ],
                );
              })
            ]),
      );
    });
  }
}
