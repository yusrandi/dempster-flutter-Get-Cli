import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/data/models/penyakit_model.dart';
import 'package:http/http.dart' as http;

import '../config/api.dart';

class PenyakitService extends GetConnect {
  Future<List<PenyakitModel>> fetchPenyakit() async {
    final response = await http.get(Uri.parse(Api.instance.getPenyakits));

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => PenyakitModel.fromJson(e)).toList();
    }
  }
}
