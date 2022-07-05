import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/data/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../modules/auth/controllers/authentication_manager.dart';
import '../config/api.dart';
import '../models/basis_model.dart';

class UserService extends GetConnect {
  final AuthenticationManager _authManager = Get.put(AuthenticationManager());

  Future<UserModel> getUser(String id) async {
    final response = await http.get(Uri.parse(Api.instance.getUser + '/' + id));
    UserModel user = UserModel.fromJson(json.decode(response.body)['data']);

    return user;
  }

  Future<String> userRegis(UserModel user, String pass) async {
    var _response = await http.post(Uri.parse(Api().getUser + '/regis'), body: {
      "name": user.name,
      "phone": user.phone,
      "address": user.address,
      "password": pass,
      "nama_anak": user.namaAnak,
      "tgl_lahir_anak": user.tglLahirAnak,
    });

    // print(_response.body);
    var data = json.decode(_response.body);
    if (data['responsecode'] == '1') {
      UserModel user = UserModel.fromJson(json.decode(_response.body)['data']);

      // login(user.id.toString());
      _authManager.login(user.id.toString());

      // await Get.offAndToNamed(Routes.HOME);
    }

    return data["responsemsg"];
  }
}
