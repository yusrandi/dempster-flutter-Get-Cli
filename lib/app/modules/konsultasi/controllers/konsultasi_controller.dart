import 'package:get/get.dart';

import '../../../data/models/laporan_model.dart';
import '../../../data/services/laporan_service.dart';
import '../../auth/controllers/authentication_manager.dart';

class KonsultasiController extends GetxController {
  final AuthenticationManager authenticationManager = Get.find();

  final count = 0.obs;
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

  Future<List<LaporanModel>> getDataLaporan() async {
    return await LaporanService()
        .getLaporanByUser(authenticationManager.getToken()!);
  }
}
