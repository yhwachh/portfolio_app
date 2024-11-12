import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_app/controllers/my_data_controller.dart';
import 'package:portfolio_app/models/my_data_model.dart';
import 'package:portfolio_app/models/user_model.dart';

class MyDataNotifier extends StateNotifier<AsyncValue<MyDataModel>> {
  final MyDataController controller;

  MyDataNotifier(this.controller) : super(const AsyncValue.loading()) {
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      final myData = await controller.loadUserData();
      state = AsyncValue.data(myData);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final myDataProvider =
    StateNotifierProvider<MyDataNotifier, AsyncValue<MyDataModel>>((ref) {
  return MyDataNotifier(MyDataController());
});
