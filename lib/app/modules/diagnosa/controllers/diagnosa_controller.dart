import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/data/models/gejala_model.dart';
import 'package:get_cli_dempster_flutter/app/data/services/gejala_service.dart';

class DiagnosaController extends GetxController {
  final count = 0.obs;
  List<int> listResult = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<List<GejalaModel>> getGejala() async {
    return await GejalaService().fetchGejala();
  }
}
