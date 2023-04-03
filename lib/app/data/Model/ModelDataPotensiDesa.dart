// To parse this JSON data, do
//
//     final modelDataPotensiDesa = modelDataPotensiDesaFromJson(jsonString);

import 'dart:convert';

ModelDataPotensiDesa modelDataPotensiDesaFromJson(String str) =>
    ModelDataPotensiDesa.fromJson(json.decode(str));

String modelDataPotensiDesaToJson(ModelDataPotensiDesa data) =>
    json.encode(data.toJson());

class ModelDataPotensiDesa {
  ModelDataPotensiDesa({
    required this.message,
    required this.total,
    required this.totalPage,
    required this.activePage,
    required this.data,
  });

  String message;
  int total;
  int totalPage;
  int activePage;
  List<PotensiDesa> data;

  factory ModelDataPotensiDesa.fromJson(Map<String, dynamic> json) =>
      ModelDataPotensiDesa(
        message: json["message"],
        total: json["total"],
        totalPage: json["total_page"],
        activePage: json["active_page"],
        data: List<PotensiDesa>.from(
            json["data"].map((x) => PotensiDesa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "total": total,
        "total_page": totalPage,
        "active_page": activePage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PotensiDesa {
  PotensiDesa({
    required this.slug,
    required this.namaPotensi,
    required this.kategori,
    required this.deskripsi,
    required this.thumbnail,
    required this.createdAt,
    required this.penduduk,
    required this.desa,
  });

  String slug;
  String namaPotensi;
  String kategori;
  String deskripsi;
  String thumbnail;
  DateTime createdAt;
  Penduduk penduduk;
  Desa desa;

  factory PotensiDesa.fromJson(Map<String, dynamic> json) => PotensiDesa(
        slug: json["slug"],
        namaPotensi: json["nama_potensi"],
        kategori: json["kategori"],
        deskripsi: json["deskripsi"],
        thumbnail: json["thumbnail"],
        createdAt: DateTime.parse(json["createdAt"]),
        penduduk: Penduduk.fromJson(json["penduduk"]),
        desa: Desa.fromJson(json["desa"]),
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "nama_potensi": namaPotensi,
        "kategori": kategori,
        "deskripsi": deskripsi,
        "thumbnail": thumbnail,
        "createdAt": createdAt.toIso8601String(),
        "penduduk": penduduk.toJson(),
        "desa": desa.toJson(),
      };
}

class Desa {
  Desa({
    required this.namaDesa,
    required this.kepalaDesa,
    required this.longtitude,
    required this.latitude,
  });

  String namaDesa;
  String kepalaDesa;
  String longtitude;
  String latitude;

  factory Desa.fromJson(Map<String, dynamic> json) => Desa(
        namaDesa: json["nama_desa"],
        kepalaDesa: json["kepala_desa"],
        longtitude: json["longtitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "nama_desa": namaDesa,
        "kepala_desa": kepalaDesa,
        "longtitude": longtitude,
        "latitude": latitude,
      };
}

class Penduduk {
  Penduduk({
    required this.nama,
    required this.nik,
    this.alamat,
  });

  String nama;
  String nik;
  dynamic alamat;

  factory Penduduk.fromJson(Map<String, dynamic> json) => Penduduk(
        nama: json["nama"],
        nik: json["nik"],
        alamat: json["alamat"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "nik": nik,
        "alamat": alamat,
      };
}
