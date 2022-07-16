import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/data/models/user_model.dart';
import 'package:get_cli_dempster_flutter/app/data/services/user_service.dart';

class ProfileController extends GetxController {
  final count = 0.obs;
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

    return userModel;
  }
}
