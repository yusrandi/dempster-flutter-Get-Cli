import 'package:get_cli_dempster_flutter/app/data/config/api.dart';
import 'package:get_cli_dempster_flutter/app/data/models/penyakit_model.dart';
import 'package:get_cli_dempster_flutter/app/data/services/gejala_service.dart';
import 'package:get_cli_dempster_flutter/app/data/services/penyakit_service.dart';
import 'package:http/http.dart' as http;

void main() async {
  List<PenyakitModel> penyakits = await PenyakitService().fetchPenyakit();

  for (var element in penyakits) {
    print(element.penyakitKode! + ' ' + element.penyakitNama!);
  }
}
