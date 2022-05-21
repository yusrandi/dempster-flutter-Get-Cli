// To parse this JSON data, do
//
//     final penyakitModel = penyakitModelFromJson(jsonString);

import 'dart:convert';

PenyakitModel penyakitModelFromJson(String str) =>
    PenyakitModel.fromJson(json.decode(str));

String penyakitModelToJson(PenyakitModel data) => json.encode(data.toJson());

class PenyakitModel {
  PenyakitModel({
    this.id,
    this.penyakitKode,
    this.penyakitNama,
  });

  int? id;
  String? penyakitKode;
  String? penyakitNama;

  factory PenyakitModel.fromJson(Map<String, dynamic> json) => PenyakitModel(
        id: json["id"],
        penyakitKode: json["penyakit_kode"],
        penyakitNama: json["penyakit_nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "penyakit_kode": penyakitKode,
        "penyakit_nama": penyakitNama,
      };
}
