import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/data/Model/ModelDataPengguna.dart';
import 'package:sitforsa/config/style.dart';

class ProfileController extends GetxController {
  final global = Get.put(GlobalController());
  var tes = false.obs;
  var isLoading = false.obs;

  // Data? pengguna;
  var nama = TextEditingController().obs;
  var nik = TextEditingController().obs;
  var alamat = TextEditingController().obs;
  var rt = TextEditingController().obs;
  var rw = TextEditingController().obs;
  var nomor_kk = TextEditingController().obs;
  var jenis_kelamin = TextEditingController().obs;
  var tempat_lahir = TextEditingController().obs;
  var tanggal_lahir = TextEditingController().obs;
  var agama = TextEditingController().obs;
  var pendidikan_dalam_kk = TextEditingController().obs;
  var pendidikan_sedang_ditempuh = TextEditingController().obs;
  var pekerjaan = TextEditingController().obs;
  var kawin = TextEditingController().obs;
  var hubungan_keluarga = TextEditingController().obs;
  var kewarganegaraan = TextEditingController().obs;
  var nama_ayah = TextEditingController().obs;
  var nik_ayah = TextEditingController().obs;
  var nama_ibu = TextEditingController().obs;
  var nik_ibu = TextEditingController().obs;
  var golongan_darah = TextEditingController().obs;
  var akta_lahir = TextEditingController().obs;
  var nomor_dokumen_paspor = TextEditingController().obs;
  var tanggal_akhir_passport = TextEditingController().obs;
  var nomor_dokumen_KITAS = TextEditingController().obs;
  var nomor_akta_perkawinan = TextEditingController().obs;
  var tanggal_perkawinan = TextEditingController().obs;
  var nomor_akta_cerai = TextEditingController().obs;
  var tanggal_perceraian = TextEditingController().obs;
  var cacat = TextEditingController().obs;
  var cara_kb = TextEditingController().obs;
  var hamil = TextEditingController().obs;
  var alamat_sekarang = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getUserProfile(token) async {
    var decodedToken = JwtDecoder.decode(token);
    isLoading(true);
    update();
    try {
      final response = await http.get(
          Uri.parse(
            global.url + '/penduduk/${decodedToken['slug']}',
          ),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode == 200) {
        // print(response.body);
        nama.value.text = jsonDecode(response.body)['data']['nama'] ?? "";
        // log(nama.value.toString());
        alamat.value.text = jsonDecode(response.body)['data']['alamat'] ?? "";
        rt.value.text = jsonDecode(response.body)['data']['rt'] ?? "";
        rw.value.text = jsonDecode(response.body)['data']['rw'] ?? "";
        nomor_kk.value.text =
            jsonDecode(response.body)['data']['nomor_kk'] ?? "";
        nik.value.text = jsonDecode(response.body)['data']['nik'] ?? "";
        jenis_kelamin.value.text =
            jsonDecode(response.body)['data']['jenis_kelamin'] ?? "";
        tempat_lahir.value.text =
            jsonDecode(response.body)['data']['tempat_lahir'] ?? "";
        tanggal_lahir.value.text =
            jsonDecode(response.body)['data']['tanggal_lahir'] ?? "";
        agama.value.text = jsonDecode(response.body)['data']['agama'] ?? "";
        pendidikan_dalam_kk.value.text =
            jsonDecode(response.body)['data']['pendidikan_dalam_kk'] ?? "";
        pendidikan_sedang_ditempuh.value.text =
            jsonDecode(response.body)['data']['pendidikan_sedang_ditempuh'] ??
                "";
        pekerjaan.value.text =
            jsonDecode(response.body)['data']['pekerjaan'] ?? "";
        kawin.value.text = jsonDecode(response.body)['data']['kawin'] ?? "";
        hubungan_keluarga.value.text =
            jsonDecode(response.body)['data']['hubungan_keluarga'] ?? "";
        kewarganegaraan.value.text =
            jsonDecode(response.body)['data']['kewarganegaraan'] ?? "";
        nama_ayah.value.text =
            jsonDecode(response.body)['data']['nama_ayah'] ?? "";
        nik_ayah.value.text =
            jsonDecode(response.body)['data']['nik_ayah'] ?? "";
        nama_ibu.value.text =
            jsonDecode(response.body)['data']['nama_ibu'] ?? "";
        nik_ibu.value.text = jsonDecode(response.body)['data']['nik_ibu'] ?? "";
        golongan_darah.value.text =
            jsonDecode(response.body)['data']['golongan_darah'] ?? "";
        akta_lahir.value.text =
            jsonDecode(response.body)['data']['akta_lahir'] ?? "";
        nomor_dokumen_paspor.value.text =
            jsonDecode(response.body)['data']['nomor_dokumen_paspor'] ?? "";
        tanggal_akhir_passport.value.text =
            jsonDecode(response.body)['data']['tanggal_akhir_passport'] ?? "";
        nomor_dokumen_KITAS.value.text =
            jsonDecode(response.body)['data']['nomor_dokumen_KITAS'] ?? "";
        nomor_akta_perkawinan.value.text =
            jsonDecode(response.body)['data']['nomor_akta_perkawinan'] ?? "";
        nomor_akta_cerai.value.text =
            jsonDecode(response.body)['data']['nomor_akta_cerai'] ?? "";
        tanggal_perceraian.value.text =
            jsonDecode(response.body)['data']['tanggal_perceraian'] ?? "";
        cacat.value.text = jsonDecode(response.body)['data']['cacat'] ?? "";
        cara_kb.value.text = jsonDecode(response.body)['data']['cara_kb'] ?? "";
        hamil.value.text = jsonDecode(response.body)['data']['hamil'] ?? "";
        alamat_sekarang.value.text =
            jsonDecode(response.body)['data']['alamat_sekarang'] ?? "";
        hamil.value.text = jsonDecode(response.body)['data']['hamil'] ?? "";
        update();
      } else {
        throw Exception('Gagal Me-load Data.');
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        titleText: Text(
          'Kesalahan',
          style: TextStyle(color: global.isDark.value ? whitey : redy),
        ),
        messageText: Text(
          'Gagal Mendapatkan Data Pengguna.',
          style: TextStyle(color: global.isDark.value ? whitey : redy),
        ),
        backgroundColor: global.isDark.value ? blacky : whitey,
        animationDuration: Duration(seconds: 1),
        duration: Duration(milliseconds: 2500),
        boxShadows: [
          BoxShadow(blurRadius: 10, color: grayNav.withOpacity(0.5))
        ],
        forwardAnimationCurve: Curves.linearToEaseOut,
        margin: EdgeInsets.all(5),
        borderRadius: 5,
        snackPosition: SnackPosition.TOP,
        barBlur: 5,
      ));
      // Get.snackbar(
      //   'Error',
      //   'Gagal mendapatkan data pengguna.',
      //   colorText: redy,
      //   backgroundColor: whitey,
      //   titleText: Text(
      //     'Kesalahan',
      //     style: TextStyle(color: redy, fontSize: global.fontSize.value),
      //   ),
      // );
    } finally {
      Timer(Duration(milliseconds: 1000), () {
        isLoading(false);
        update();
      });
    }
  }

  editProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var decodedToken = JwtDecoder.decode(prefs.getString('token').toString());
    isLoading(true);
    update();
    try {
      final response = await http.put(
        Uri.parse(
          global.url + '/penduduk/edit/${decodedToken['slug']}',
        ),
        body: json.encode({
          "nama": nama.value.text,
          "nik": nik.value.text,
          "alamat": alamat.value.text,
          "rt": rt.value.text,
          "rw": rw.value.text,
          "nomor_kk": nomor_kk.value.text,
          "jenis_kelamin": jenis_kelamin.value.text,
          "tempat_lahir": tempat_lahir.value.text,
          "tanggal_lahir": tanggal_lahir.value.text,
          "agama": agama.value.text,
          "pendidikan_dalam_kk": pendidikan_dalam_kk.value.text,
          "pendidikan_sedang_ditempuh": pendidikan_sedang_ditempuh.value.text,
          "pekerjaan": pekerjaan.value.text,
          "kawin": kawin.value.text,
          "hubungan_keluarga": hubungan_keluarga.value.text,
          "kewarganegaraan": kewarganegaraan.value.text,
          "nama_ayah": nama_ayah.value.text,
          "nik_ayah": nik_ayah.value.text,
          "nama_ibu": nama_ibu.value.text,
          "nik_ibu": nik_ibu.value.text,
          "golongan_darah": golongan_darah.value.text,
          "akta_lahir": akta_lahir.value.text,
          "nomor_dokumen_paspor": nomor_dokumen_paspor.value.text,
          "tanggal_akhir_passport": tanggal_akhir_passport.value.text,
          "nomor_dokumen_KITAS": nomor_dokumen_KITAS.value.text,
          "nomor_akta_perkawinan": nomor_akta_perkawinan.value.text,
          "tanggal_perkawinan": tanggal_perkawinan.value.text,
          "nomor_akta_cerai": nomor_akta_cerai.value.text,
          "tanggal_perceraian": tanggal_perceraian.value.text,
          "cacat": cacat.value.text,
          "cara_kb": cara_kb.value.text,
          "hamil": hamil.value.text,
          "alamat_sekarang": alamat_sekarang.value.text
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${prefs.getString('token').toString()}',
        },
      );
      print(global.url + '/penduduk/edit/${decodedToken['slug']}');
      if (response.statusCode == 200) {
        Get.snackbar('Berhasil', 'Data Berhasil Disimpan',
            colorText: greenny, backgroundColor: whitey);
        getUserProfile(prefs.getString('token').toString());
        Timer(Duration(seconds: 2), () => Get.back());
      } else {
        isLoading(false);
        update();
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'].toString(),
          colorText: redy,
          backgroundColor: whitey,
          titleText: Text(
            'Error',
            style:
                TextStyle(color: whitey, fontSize: global.fontSize.toDouble()),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
      isLoading(false);
      update();
      Get.snackbar(
        'Error',
        'Ada kesalahan, coba beberapa saat lagi',
        colorText: redy,
        backgroundColor: whitey,
        titleText: Text(
          'Error',
          style: TextStyle(color: whitey, fontSize: global.fontSize.toDouble()),
        ),
      );
    } finally {
      Timer(Duration(milliseconds: 1000), () {
        isLoading(false);
        update();
      });
    }
  }
}
