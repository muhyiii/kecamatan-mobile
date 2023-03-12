// To parse this JSON data, do
//
//     final modelBerita = modelBeritaFromJson(jsonString);

import 'dart:convert';

ModelBerita modelBeritaFromJson(String str) => ModelBerita.fromJson(json.decode(str));

String modelBeritaToJson(ModelBerita data) => json.encode(data.toJson());

class ModelBerita {
    ModelBerita({
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
    List<Berita> data;

    factory ModelBerita.fromJson(Map<String, dynamic> json) => ModelBerita(
        message: json["message"],
        total: json["total"],
        totalPage: json["total_page"],
        activePage: json["active_page"],
        data: List<Berita>.from(json["data"].map((x) => Berita.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "total": total,
        "total_page": totalPage,
        "active_page": activePage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Berita {
    Berita({
        required this.slug,
        required this.judul,
        required this.konten,
        required this.thumbnail,
        required this.createdAt,
        required this.author,
    });

    String slug;
    String judul;
    String konten;
    String thumbnail;
    DateTime createdAt;
    Author author;

    factory Berita.fromJson(Map<String, dynamic> json) => Berita(
        slug: json["slug"],
        judul: json["judul"],
        konten: json["konten"],
        thumbnail: json["thumbnail"],
        createdAt: DateTime.parse(json["createdAt"]),
        author: Author.fromJson(json["author"]),
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "judul": judul,
        "konten": konten,
        "thumbnail": thumbnail,
        "createdAt": createdAt.toIso8601String(),
        "author": author.toJson(),
    };
}

class Author {
    Author({
        required this.email,
        required this.username,
    });

    String email;
    String username;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        email: json["email"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
    };
}
