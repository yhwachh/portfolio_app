import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';
import 'package:portfolio_app/core/routes/app_router.dart';
import 'package:portfolio_app/core/l10n/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      data: AppThemeData.dark(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        supportedLocales: L10n.all,
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: appRouter.config(),
      ),
    );
  }
}
