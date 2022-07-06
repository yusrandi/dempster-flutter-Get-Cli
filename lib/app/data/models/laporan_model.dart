// To parse this JSON data, do
//
//     final laporanModel = laporanModelFromJson(jsonString);

import 'dart:convert';

import 'package:get_cli_dempster_flutter/app/data/models/penyakit_model.dart';

LaporanModel laporanModelFromJson(String str) =>
    LaporanModel.fromJson(json.decode(str));

String laporanModelToJson(LaporanModel data) => json.encode(data.toJson());

class LaporanModel {
  LaporanModel({
    this.id,
    this.penyakits,
    this.gejalas,
    this.userId,
    this.cf,
    this.tanggal,
  });

  int? id;
  String? penyakits;
  String? gejalas;
  int? userId;
  String? cf;
  String? tanggal;

  factory LaporanModel.fromJson(Map<String, dynamic> json) => LaporanModel(
        id: json["id"],
        penyakits: json["penyakits"],
        gejalas: json["gejalas"],
        userId: json["user_id"],
        cf: json["cf"],
        tanggal: json["tanggal"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "penyakits": penyakits,
        "gejalas": gejalas,
        "user_id": userId,
        "cf": cf,
        "tanggal": tanggal,
      };
}
