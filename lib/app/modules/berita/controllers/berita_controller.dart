import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/data/Model/ModelBerita.dart';
import 'package:http/http.dart' as http;
import 'package:sitforsa/config/style.dart';

class BeritaController extends GetxController {
  final global = Get.put(GlobalController());
  var isLoading = false.obs;
  var dataBerita = List<Berita>.empty().obs;
  final isSearch = false.obs;
  // final url = 'http://192.168.43.59:8000/api/berita';
  final count = 0.obs;
  @override
  void onInit() {
    getBerita();
    Timer.periodic(Duration(seconds: 100), (timer) {
      getBerita();
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getBerita() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    isLoading(true);
    update();
    try {
      final response =
          await http.get(Uri.parse(global.url + '/berita'), headers: {
        'Authorization': 'Bearer ${prefs.getString('token').toString()}',
      });
      if (response.statusCode == 200) {
        ModelBerita data = modelBeritaFromJson(response.body.toString());
        dataBerita.value = data.data;
        print(isLoading.value);
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
          'Gagal Mendapatkan Data Berita.',
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
      isLoading(false);
      update();

      // print(dataBerita);?
    }
  }
}
