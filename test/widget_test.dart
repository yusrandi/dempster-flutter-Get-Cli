import 'dart:math';

import 'package:get_cli_dempster_flutter/app/data/config/api.dart';
import 'package:get_cli_dempster_flutter/app/data/models/basis_model.dart';
import 'package:get_cli_dempster_flutter/app/data/models/gejala_model.dart';
import 'package:get_cli_dempster_flutter/app/data/models/penyakit_model.dart';
import 'package:get_cli_dempster_flutter/app/data/services/basis_service.dart';
import 'package:get_cli_dempster_flutter/app/data/services/gejala_service.dart';
import 'package:get_cli_dempster_flutter/app/data/services/penyakit_service.dart';
import 'package:http/http.dart' as http;

void main() async {
  List<PenyakitModel> penyakits = await PenyakitService().fetchPenyakit();
  List<GejalaModel> gejalas = await GejalaService().fetchGejala();
  List<BasisModel> basis = await BasisService().fetchBasis();

  var userGejalas = [1, 2, 3];
  var penyakitLabel = "";
  var bobot = "";
  double bobotX = 0.0;

  for (var uGe in userGejalas) {
    print("Gejala $uGe");
    penyakitLabel = "";
    bobot = "";
    for (var b in basis) {
      if (b.gejalaId == uGe) {
        // print(
        //     "Penyakit ${b.penyakitId},  Bobot ${b.bobot}, BobotX ${roundDouble(1 - double.parse(b.bobot!), 2)}");
        penyakitLabel += "Penyakit ${b.penyakitId},";
        bobot = b.bobot!;
        bobotX = roundDouble(1 - double.parse(b.bobot!), 2);
      }
    }
    print(penyakitLabel);
    print(bobot);
    print(bobotX);
  }
}

double roundDouble(double value, int places) {
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}
