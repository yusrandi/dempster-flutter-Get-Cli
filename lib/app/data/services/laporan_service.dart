import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/data/models/laporan_model.dart';
import 'package:http/http.dart' as http;

import '../config/api.dart';

class LaporanService extends GetConnect {
  Future<List<LaporanModel>> getLaporanByUser(String id) async {
    final response =
        await http.get(Uri.parse(Api.instance.laporanUrl + '/' + id));
    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => LaporanModel.fromJson(e)).toList();
    }
  }

  Future<String> create(LaporanModel model) async {
    var _response = await http.post(Uri.parse(Api().laporanUrl), body: {
      "penyakits": model.penyakits,
      "gejalas": model.gejalas,
      "user_id": model.userId.toString(),
      "cf": model.cf,
    });

    // print(_response.body);
    var data = json.decode(_response.body);
    return data["responsemsg"];
  }
}
