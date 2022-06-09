// To parse this JSON data, do
//
//     final basisModel = basisModelFromJson(jsonString);

import 'dart:convert';


BasisModel basisModelFromJson(String str) =>
    BasisModel.fromJson(json.decode(str));

String basisModelToJson(BasisModel data) => json.encode(data.toJson());

class BasisModel {
  BasisModel({this.id, this.penyakitId, this.gejalaId, this.bobot});

  int? id;
  int? penyakitId;
  int? gejalaId;
  String? bobot;

  factory BasisModel.fromJson(Map<String, dynamic> json) => BasisModel(
        id: json["id"],
        penyakitId: json["penyakit_id"],
        gejalaId: json["gejala_id"],
        bobot: (json["bobot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "penyakit_id": penyakitId,
        "gejala_id": gejalaId,
        "bobot": bobot,
      };
}
