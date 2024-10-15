import 'package:flutter/material.dart';
import 'package:portfolio_app/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            locale.app_language,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
