import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void getBerita() async {
    isLoading(true);
    update();
    try {
      final response = await http.get(Uri.parse(global.url + '/berita'));
      if (response.statusCode == 200) {
        ModelBerita data = modelBeritaFromJson(response.body.toString());
        dataBerita.value = data.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal mendapatkan data berita',
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
      print(dataBerita);
    }
  }
}
