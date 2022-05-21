// To parse this JSON data, do
//
//     final gejalaModel = gejalaModelFromJson(jsonString);

import 'dart:convert';

GejalaModel gejalaModelFromJson(String str) =>
    GejalaModel.fromJson(json.decode(str));

String gejalaModelToJson(GejalaModel data) => json.encode(data.toJson());

class GejalaModel {
  GejalaModel({
    this.id,
    this.gejalaKode,
    this.gejalaNama,
    this.status,
  });

  int? id;
  String? gejalaKode;
  String? gejalaNama;
  String? status;

  factory GejalaModel.fromJson(Map<String, dynamic> json) => GejalaModel(
        id: json["id"],
        gejalaKode: json["gejala_kode"],
        gejalaNama: json["gejala_nama"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gejala_kode": gejalaKode,
        "gejala_nama": gejalaNama,
        "status": status,
      };
}
