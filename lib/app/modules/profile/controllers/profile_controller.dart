import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/data/models/user_model.dart';
import 'package:get_cli_dempster_flutter/app/data/services/user_service.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_strings.dart';

enum Status { none, running, stopped, paused }

class ProfileController extends GetxController {
  final count = 0.obs;
  Rx<Status> status = Status.none.obs;
  RxBool passwordVisible = false.obs;
  RxString selectedDate = 'Tanggal Lahir Anak'.obs;

  @override
  void onInit() async {
    super.onInit();
    // print(await getUser());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<UserModel> getUser() async {
    UserModel userModel = await UserService().getUser();

    // selectedDate.value = userModel.tglLahirAnak!;

    return userModel;
  }

  Future<String> userUpdate(
      String id, String nama, String anak, String alamat, String phone) async {
    print('lahir ${selectedDate.value}');
    status.value = Status.running;

    var haha = await UserService()
        .userUpdate(id, nama, anak, selectedDate.value, alamat, phone);

    status.value = Status.none;

    Get.snackbar(CoreStrings.appName, "$haha",
        backgroundColor: CoreColor.whiteSoft, duration: Duration(seconds: 2));
    print(haha);

    return haha;
  }
}
