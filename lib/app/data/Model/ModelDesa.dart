// To parse this JSON data, do
//
//     final modelDesa = modelDesaFromJson(jsonString);

import 'dart:convert';

ModelDesa modelDesaFromJson(String str) => ModelDesa.fromJson(json.decode(str));

String modelDesaToJson(ModelDesa data) => json.encode(data.toJson());

class ModelDesa {
    ModelDesa({
        required this.message,
        required this.data,
    });

    String message;
    List<Desa> data;

    factory ModelDesa.fromJson(Map<String, dynamic> json) => ModelDesa(
        message: json["message"],
        data: List<Desa>.from(json["data"].map((x) => Desa.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Desa {
    Desa({
        required this.id,
        required this.slug,
        required this.namaDesa,
        required this.longtitude,
        required this.latitude,
    });

    int id;
    String slug;
    String namaDesa;
    String longtitude;
    String latitude;

    factory Desa.fromJson(Map<String, dynamic> json) => Desa(
        id: json["id"],
        slug: json["slug"],
        namaDesa: json["nama_desa"],
        longtitude: json["longtitude"],
        latitude: json["latitude"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "nama_desa": namaDesa,
        "longtitude": longtitude,
        "latitude": latitude,
    };
}
