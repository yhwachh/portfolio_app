import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/core/design_system/app_ui.dart';

final appThemeProvider = StateProvider<AppThemeData>((ref) {
  return AppThemeData.light();
});
