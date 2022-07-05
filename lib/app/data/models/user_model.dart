// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.roleId,
    this.namaAnak,
    this.tglLahirAnak,
  });

  int? id;
  String? name;
  String? address;
  String? phone;
  int? roleId;
  String? namaAnak;
  String? tglLahirAnak;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        roleId: json["role_id"],
        namaAnak: json["nama_anak"],
        tglLahirAnak: json["tgl_lahir_anak"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "role_id": roleId,
        "nama_anak": namaAnak,
        "tgl_lahir_anak": tglLahirAnak,
      };
}
