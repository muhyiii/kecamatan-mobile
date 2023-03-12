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

  var isLoading = false.obs;
  var dataPengguna = {}.obs;

  @override
  void onInit() {
    super.onInit();
    initApp();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  initApp() async {
    // isLoading(true);
    // update();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getUserProfile(prefs.getString('token').toString());
  }

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
      print(response.body);
      if (response.statusCode == 200) {
        dataPengguna.value = jsonDecode(response.body)['data'];
        print(dataPengguna);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal mendapatkan data pengguna',
          backgroundColor: redy,
          titleText: Text(
            'Error',
            style:
                TextStyle(color: whitey, fontSize: global.fontSize.toDouble()),
          ),
          colorText: whitey);
    } finally {
      Timer(Duration(milliseconds: 1000), () {
        isLoading(false);
        update();
      });
    }
  }
}
