import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
    var screenSize = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context)!;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      color: Colors.yellow,
      child: Row(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Front-end.web(developer)_",
                style: TextStyle(fontSize: 24),
                // Centrer le texte
              ),
            ),
          ),
          const RotatedBox(
            quarterTurns: -1,
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "dark mode.",
                  style: TextStyle(fontSize: 14),
                )),
          ),
        ],
      ),
    );
  }
}
