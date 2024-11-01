import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';
import 'package:portfolio_app/core/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_app/core/routes/app_router.gr.dart';
import 'package:portfolio_app/views/pages/contact_page.dart';
import 'package:portfolio_app/views/pages/left_menu.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final theme = AppTheme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context)!;
    return Center(
        child: Padding(
      padding: EdgeInsets.all(screenSize.width / 4),
      child: Row(
        children: [
          TypingTextAnimation(
            texts: [
              localizations.txt_home_intro0,
              localizations.txt_home_intro1
            ],
            textStyle: TextStyle(color: Colors.black, fontSize: 24.0),
          ),
        ],
      ),
    ));
  }
}
