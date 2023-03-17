import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/data/Model/ModelDataKontak.dart';
import 'package:sitforsa/config/style.dart';

class KontakPentingController extends GetxController {
  //TODO: Implement KontakPentingController

  final global = Get.put(GlobalController());
  var isLoading = false.obs;
  var dataKontak = List<Kontak>.empty().obs;
  @override
  void onInit() {
    super.onInit();
    Timer.periodic(Duration(seconds: 100), (timer) {
      getKontak();
    });
    getKontak();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getKontak() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading(true);
    update();
    try {
      final response =
          await http.get(Uri.parse(global.url + '/kontak'), headers: {
        'Authorization': 'Bearer ${prefs.getString('token').toString()}',
      });
      if (response.statusCode == 200) {
        ModelDataKontak data =
            modelDataKontakFromJson(response.body.toString());
        dataKontak.value = data.data;
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
      print(dataKontak);
    }
  }
}
