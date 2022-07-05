import 'package:get/get.dart';

import 'cache_result.dart';

class ResultManager extends GetxController with CacheResult {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
  }

  void insertResult(String id, double value) async {
    await saveResult(id: id, value: value);
  }
}
