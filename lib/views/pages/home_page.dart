import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/core/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio_app/core/routes/app_router.gr.dart';
import 'package:portfolio_app/views/pages/contact_page.dart';
import 'package:portfolio_app/views/pages/left_menu.dart';

import 'package:typing_text/typing_text.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(screenSize.width / 4),
        child: TypingText(
          words: [
            'Bonjour',
            'Je suis babyc',
            "A customizable, animated text widget for Flutter apps, simulating the effect of typing. This package is ideal for creating engaging text animations, such as typing effects in chatbots, creative text displays in storytelling apps, or any application where text needs to be displayed dynamically and with visual flair."
          ],
          letterSpeed: Duration(milliseconds: 100),
          wordSpeed: Duration(milliseconds: 1000),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
