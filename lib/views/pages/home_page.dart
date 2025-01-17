import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final localizations = AppLocalizations.of(context)!;

    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.15),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: screenSize.height),
        child: Center(
            child: Row(
          children: [
            TypingTextAnimation(
              texts: [
                localizations.txt_home_intro0,
                localizations.txt_home_intro1,
              ],
              textStyle: GoogleFonts.montserrat(
                  color: theme.colors.textColor, fontSize: 24.0),
            ),
          ],
        )),
      ),
    );
  }
}
