import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLanguageProvider = StateProvider<Locale>((ref) {
  return const Locale('en');
});
