// To parse this JSON data, do
//
//     final modelDataPelayanan = modelDataPelayananFromJson(jsonString);

import 'dart:convert';

ModelDataPelayanan modelDataPelayananFromJson(String str) => ModelDataPelayanan.fromJson(json.decode(str));

String modelDataPelayananToJson(ModelDataPelayanan data) => json.encode(data.toJson());

class ModelDataPelayanan {
    ModelDataPelayanan({
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
    List<Pelayanan> data;

    factory ModelDataPelayanan.fromJson(Map<String, dynamic> json) => ModelDataPelayanan(
        message: json["message"],
        total: json["total"],
        totalPage: json["total_page"],
        activePage: json["active_page"],
        data: List<Pelayanan>.from(json["data"].map((x) => Pelayanan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "total": total,
        "total_page": totalPage,
        "active_page": activePage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Pelayanan {
    Pelayanan({
        required this.id,
        required this.slug,
        required this.nama,
        required this.syarat,
        required this.template,
    });

    int id;
    String slug;
    String nama;
    List<String> syarat;
    String template;

    factory Pelayanan.fromJson(Map<String, dynamic> json) => Pelayanan(
        id: json["id"],
        slug: json["slug"],
        nama: json["nama"],
        syarat: List<String>.from(json["syarat"].map((x) => x)),
        template: json["template"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "nama": nama,
        "syarat": List<dynamic>.from(syarat.map((x) => x)),
        "template": template,
    };
}
