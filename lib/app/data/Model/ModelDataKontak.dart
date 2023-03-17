// To parse this JSON data, do
//
//     final modelDataKontak = modelDataKontakFromJson(jsonString);

import 'dart:convert';

ModelDataKontak modelDataKontakFromJson(String str) =>
    ModelDataKontak.fromJson(json.decode(str));

String modelDataKontakToJson(ModelDataKontak data) =>
    json.encode(data.toJson());

class ModelDataKontak {
  ModelDataKontak({
    required this.message,
    required this.data,
  });

  String message;
  List<Kontak> data;

  factory ModelDataKontak.fromJson(Map<String, dynamic> json) =>
      ModelDataKontak(
        message: json["message"],
        data: List<Kontak>.from(json["data"].map((x) => Kontak.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Kontak {
  Kontak({
    required this.slug,
    required this.nama,
    required this.noHp,
  });

  String slug;
  String nama;
  String noHp;

  factory Kontak.fromJson(Map<String, dynamic> json) => Kontak(
        slug: json["slug"],
        nama: json["nama"],
        noHp: json["no_hp"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "nama": nama,
        "no_hp": noHp,
      };
}
