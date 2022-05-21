import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_cli_dempster_flutter/app/data/models/gejala_model.dart';
import 'package:http/http.dart' as http;

import '../config/api.dart';

class GejalaService extends GetConnect {
  Future<List<GejalaModel>> fetchGejala() async {
    final response = await http.get(Uri.parse(Api.instance.getGejalas));

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => GejalaModel.fromJson(e)).toList();
    }
  }
}
