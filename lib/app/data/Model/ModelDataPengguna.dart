// To parse this JSON data, do
//
//     final modelDataPengguna = modelDataPenggunaFromJson(jsonString);

import 'dart:convert';

ModelDataPengguna modelDataPenggunaFromJson(String str) => ModelDataPengguna.fromJson(json.decode(str));

String modelDataPenggunaToJson(ModelDataPengguna data) => json.encode(data.toJson());

class ModelDataPengguna {
    ModelDataPengguna({
        required this.message,
        required this.pengguna,
    });

    String message;
    Pengguna pengguna;

    factory ModelDataPengguna.fromJson(Map<String, dynamic> json) => ModelDataPengguna(
        message: json["message"],
        pengguna: Pengguna.fromJson(json["pengguna"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "pengguna": pengguna.toJson(),
    };
}

class Pengguna {
    Pengguna({
        required this.nama,
        required this.slug,
        this.alamat,
        this.rt,
        this.rw,
        this.nomorKk,
        required this.nik,
        this.jenisKelamin,
        this.tempatLahir,
        this.tanggalLahir,
        this.agama,
        this.pendidikanDalamKk,
        this.pendidikanSedangDitempuh,
        this.pekerjaan,
        this.kawin,
        this.hubunganKeluarga,
        this.kewarganegaraan,
        this.namaAyah,
        this.nikAyah,
        this.namaIbu,
        this.nikIbu,
        this.golonganDarah,
        this.aktaLahir,
        this.nomorDokumenPaspor,
        this.tanggalAkhirPassport,
        this.nomorDokumenKitas,
        this.nomorAktaPerkawinan,
        this.tanggalPerkawinan,
        this.nomorAktaCerai,
        this.tanggalPerceraian,
        this.cacat,
        this.caraKb,
        this.hamil,
        this.alamatSekarang,
        required this.desa,
    });

    String nama;
    String slug;
    dynamic alamat;
    dynamic rt;
    dynamic rw;
    dynamic nomorKk;
    String nik;
    dynamic jenisKelamin;
    dynamic tempatLahir;
    dynamic tanggalLahir;
    dynamic agama;
    dynamic pendidikanDalamKk;
    dynamic pendidikanSedangDitempuh;
    dynamic pekerjaan;
    dynamic kawin;
    dynamic hubunganKeluarga;
    dynamic kewarganegaraan;
    dynamic namaAyah;
    dynamic nikAyah;
    dynamic namaIbu;
    dynamic nikIbu;
    dynamic golonganDarah;
    dynamic aktaLahir;
    dynamic nomorDokumenPaspor;
    dynamic tanggalAkhirPassport;
    dynamic nomorDokumenKitas;
    dynamic nomorAktaPerkawinan;
    dynamic tanggalPerkawinan;
    dynamic nomorAktaCerai;
    dynamic tanggalPerceraian;
    dynamic cacat;
    dynamic caraKb;
    dynamic hamil;
    dynamic alamatSekarang;
    Desa desa;

    factory Pengguna.fromJson(Map<String, dynamic> json) => Pengguna(
        nama: json["nama"],
        slug: json["slug"],
        alamat: json["alamat"],
        rt: json["rt"],
        rw: json["rw"],
        nomorKk: json["nomor_kk"],
        nik: json["nik"],
        jenisKelamin: json["jenis_kelamin"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"],
        agama: json["agama"],
        pendidikanDalamKk: json["pendidikan_dalam_kk"],
        pendidikanSedangDitempuh: json["pendidikan_sedang_ditempuh"],
        pekerjaan: json["pekerjaan"],
        kawin: json["kawin"],
        hubunganKeluarga: json["hubungan_keluarga"],
        kewarganegaraan: json["kewarganegaraan"],
        namaAyah: json["nama_ayah"],
        nikAyah: json["nik_ayah"],
        namaIbu: json["nama_ibu"],
        nikIbu: json["nik_ibu"],
        golonganDarah: json["golongan_darah"],
        aktaLahir: json["akta_lahir"],
        nomorDokumenPaspor: json["nomor_dokumen_paspor"],
        tanggalAkhirPassport: json["tanggal_akhir_passport"],
        nomorDokumenKitas: json["nomor_dokumen_KITAS"],
        nomorAktaPerkawinan: json["nomor_akta_perkawinan"],
        tanggalPerkawinan: json["tanggal_perkawinan"],
        nomorAktaCerai: json["nomor_akta_cerai"],
        tanggalPerceraian: json["tanggal_perceraian"],
        cacat: json["cacat"],
        caraKb: json["cara_kb"],
        hamil: json["hamil"],
        alamatSekarang: json["alamat_sekarang"],
        desa: Desa.fromJson(json["desa"]),
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "slug": slug,
        "alamat": alamat,
        "rt": rt,
        "rw": rw,
        "nomor_kk": nomorKk,
        "nik": nik,
        "jenis_kelamin": jenisKelamin,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir,
        "agama": agama,
        "pendidikan_dalam_kk": pendidikanDalamKk,
        "pendidikan_sedang_ditempuh": pendidikanSedangDitempuh,
        "pekerjaan": pekerjaan,
        "kawin": kawin,
        "hubungan_keluarga": hubunganKeluarga,
        "kewarganegaraan": kewarganegaraan,
        "nama_ayah": namaAyah,
        "nik_ayah": nikAyah,
        "nama_ibu": namaIbu,
        "nik_ibu": nikIbu,
        "golongan_darah": golonganDarah,
        "akta_lahir": aktaLahir,
        "nomor_dokumen_paspor": nomorDokumenPaspor,
        "tanggal_akhir_passport": tanggalAkhirPassport,
        "nomor_dokumen_KITAS": nomorDokumenKitas,
        "nomor_akta_perkawinan": nomorAktaPerkawinan,
        "tanggal_perkawinan": tanggalPerkawinan,
        "nomor_akta_cerai": nomorAktaCerai,
        "tanggal_perceraian": tanggalPerceraian,
        "cacat": cacat,
        "cara_kb": caraKb,
        "hamil": hamil,
        "alamat_sekarang": alamatSekarang,
        "desa": desa.toJson(),
    };
}

class Desa {
    Desa({
        required this.namaDesa,
        required this.kepalaDesa,
        required this.slug,
        required this.longtitude,
        required this.latitude,
    });

    String namaDesa;
    String kepalaDesa;
    String slug;
    String longtitude;
    String latitude;

    factory Desa.fromJson(Map<String, dynamic> json) => Desa(
        namaDesa: json["nama_desa"],
        kepalaDesa: json["kepala_desa"],
        slug: json["slug"],
        longtitude: json["longtitude"],
        latitude: json["latitude"],
    );

    Map<String, dynamic> toJson() => {
        "nama_desa": namaDesa,
        "kepala_desa": kepalaDesa,
        "slug": slug,
        "longtitude": longtitude,
        "latitude": latitude,
    };
}
