import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/controllers/my_data_controller.dart';
import 'package:portfolio_app/models/my_data_model.dart';
import 'package:portfolio_app/providers/app_language_provider.dart';

class MyDataNotifier extends StateNotifier<AsyncValue<MyDataModel>> {
  final MyDataController controller;
  final Locale locale;

  MyDataNotifier({
    required this.controller,
    required this.locale,
  }) : super(const AsyncValue.loading()) {
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      final myData = await controller.loadUserData(locale.languageCode);
      state = AsyncValue.data(myData);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final myDataProvider = StateNotifierProvider<MyDataNotifier, AsyncValue<MyDataModel>>((ref) {
  return MyDataNotifier(
    controller: MyDataController(),
    locale: ref.watch(appLanguageProvider),
  );
});
