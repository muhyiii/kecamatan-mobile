import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/data/Model/ModelDataPotensiDesa.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitforsa/config/style.dart';

class PotensiDesaController extends GetxController {
  //TODO: Implement PotensiDesaController

  final isLoading = false.obs;
  var dataPotensi = List<PotensiDesa>.empty().obs;
  final global = Get.put(GlobalController());
  @override
  void onInit() {
    super.onInit();
    getPotensiDesa();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getPotensiDesa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading(true);
    update();
    try {
      final response =
          await http.get(Uri.parse(global.url + '/potensi-desa'), headers: {
        'Authorization': 'Bearer ${prefs.getString('token').toString()}',
      });
      if (response.statusCode == 200) {
        ModelDataPotensiDesa data =
            modelDataPotensiDesaFromJson(response.body.toString());
        dataPotensi.value = data.data;
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
          'Gagal Mendapatkan Data Kontak.',
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
    } finally {
      Timer(Duration(milliseconds: 1000), () {
        isLoading(false);
        update();
      });
      print(dataPotensi);
    }
  }
}
