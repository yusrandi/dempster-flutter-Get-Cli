import 'dart:convert';

import 'package:get/get.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_strings.dart';
import '../../../data/config/api.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/user_service.dart';
import 'authentication_manager.dart';
import 'cache_manager.dart';
import 'package:http/http.dart' as http;

enum Status { none, running, stopped, paused }

class AuthController extends GetxController with CacheManager {
  final count = 0.obs;
  Rx<Status> status = Status.none.obs;
  RxBool passwordVisible = false.obs;
  late final AuthenticationManager _authManager;
  RxString selectedDate = 'Tanggal Lahir Anak'.obs;

  @override
  void onInit() {
    super.onInit();
    _authManager = Get.find();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<String> loginUser(String phone, String password) async {
    status.value = Status.running;
    var _response = await http.post(Uri.parse(Api().getUser + '/login'), body: {
      "phone": phone,
      "password": password,
    });

    status.value = Status.none;

    var data = json.decode(_response.body);
    print(data['responsecode']);
    if (data['responsecode'] == '1') {
      UserModel user = UserModel.fromJson(json.decode(_response.body)['user']);

      // login(user.id.toString());
      _authManager.login(user.id.toString());

      // await Get.offAndToNamed(Routes.HOME);
    }

    Get.snackbar(CoreStrings.appName, "${data['responsemsg']}",
        backgroundColor: CoreColor.whiteSoft, duration: Duration(seconds: 2));
    return _response.body;
  }

  Future<String> lupapassword(String phone, String password) async {
    status.value = Status.running;
    var _response = await http.post(Uri.parse(Api().lupapasswordUrl), body: {
      "phone": phone.toString(),
      "password": password.toString(),
    });

    status.value = Status.none;

    var data = json.decode(_response.body);
    print(data['responsecode']);

    Get.snackbar(CoreStrings.appName, "${data['responsemsg']}",
        backgroundColor: CoreColor.whiteSoft, duration: Duration(seconds: 2));

    if (data['responsecode'] == '1') {
      count.value = 0;
    }
    return _response.body;
  }

  Future<String> userDaftar(UserModel user, String pass) async {
    print('lahir ${selectedDate.value}');
    status.value = Status.running;

    var haha = await UserService().userRegis(
        UserModel(
            id: 0,
            name: user.name,
            address: user.address,
            phone: user.phone,
            tglLahirAnak: selectedDate.value,
            namaAnak: user.namaAnak),
        pass);

    status.value = Status.none;

    Get.snackbar(CoreStrings.appName, "$haha",
        backgroundColor: CoreColor.whiteSoft, duration: Duration(seconds: 2));
    print(haha);

    return haha;
  }
}
