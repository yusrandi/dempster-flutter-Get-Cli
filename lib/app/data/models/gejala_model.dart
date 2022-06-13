// To parse this JSON data, do
//
//     final gejalaModel = gejalaModelFromJson(jsonString);

import 'dart:convert';

import 'package:get_cli_dempster_flutter/app/data/models/basis_model.dart';

GejalaModel gejalaModelFromJson(String str) =>
    GejalaModel.fromJson(json.decode(str));

String gejalaModelToJson(GejalaModel data) => json.encode(data.toJson());

class GejalaModel {
  GejalaModel({
    this.id,
    this.gejalaKode,
    this.gejalaNama,
    this.status,
    this.bobot,
    this.basisPengetahuans,
  });

  int? id;
  String? gejalaKode;
  String? gejalaNama;
  String? status;
  String? bobot;
  List<BasisModel>? basisPengetahuans;

  factory GejalaModel.fromJson(Map<String, dynamic> json) => GejalaModel(
        id: json["id"],
        gejalaKode: json["gejala_kode"],
        gejalaNama: json["gejala_nama"],
        status: json["status"],
        bobot: json["bobot"],
        basisPengetahuans: List<BasisModel>.from(
            json["basis_pengetahuans"].map((x) => BasisModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gejala_kode": gejalaKode,
        "gejala_nama": gejalaNama,
        "status": status,
        "bobot": bobot,
        "basis_pengetahuans":
            List<dynamic>.from(basisPengetahuans!.map((x) => x.toJson())),
      };
}
