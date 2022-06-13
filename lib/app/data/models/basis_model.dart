// To parse this JSON data, do
//
//     final basisModel = basisModelFromJson(jsonString);

import 'dart:convert';

import 'package:get_cli_dempster_flutter/app/data/models/penyakit_model.dart';

BasisModel basisModelFromJson(String str) =>
    BasisModel.fromJson(json.decode(str));

String basisModelToJson(BasisModel data) => json.encode(data.toJson());

class BasisModel {
  BasisModel({this.id, this.penyakitId, this.gejalaId, this.penyakit});

  int? id;
  int? penyakitId;
  int? gejalaId;
  PenyakitModel? penyakit;

  factory BasisModel.fromJson(Map<String, dynamic> json) => BasisModel(
        id: json["id"],
        penyakitId: json["penyakit_id"],
        gejalaId: json["gejala_id"],
        penyakit: PenyakitModel.fromJson(json["penyakit"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "penyakit_id": penyakitId,
        "gejala_id": gejalaId,
        "penyakit": penyakit!.toJson(),
      };
}
