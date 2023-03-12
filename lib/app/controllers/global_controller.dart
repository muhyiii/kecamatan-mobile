
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitforsa/app/data/Model/ModelDesa.dart';
import 'package:sitforsa/config/style.dart';

class GlobalController extends GetxController {
  // var profile = Get.put(ProfileController());
  final url = 'http://192.168.90.16:8000/api';
  var dataDesa = List<Desa>.empty().obs;
  final fontHeading = 27.0.obs;
  final fontSize = 18.0.obs;
  final fontSet = 13.0.obs;
  final fontSmall = 10.0.obs;
  final format =
      NumberFormat.currency(locale: 'ID', symbol: 'Rp ', decimalDigits: 0).obs;

  final isDark = false.obs;

  final token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.width <= 360) {
      fontHeading.value = 27.0;
      fontSize.value = 18.0;
      fontSet.value = 13.0;
      fontSmall.value = 10;
    } else if (Get.width > 360 && Get.width <= 720) {
      fontHeading.value = 30.0;
      fontSize.value = 21.0;
      fontSet.value = 16.0;
      fontSmall.value = 13.0;
    } else {
      fontHeading.value = 33.0;
      fontSize.value = 24.0;
      fontSet.value = 19.0;
      fontSmall.value = 16.0;
    }
    getDesa();
    // initApp();
  }

  @override
  void onReady() {
    super.onReady();
  }

  clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  void onClose() {}

  getDesa() async {
    try {
      final response = await http.get(Uri.parse(url + '/desa'));

      if (response.statusCode == 200) {
        ModelDesa data = modelDesaFromJson(response.body.toString());
        dataDesa.value = data.data;
      } else {
        throw Exception('Gagal untuk mendapatkan data desa');
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal mendapatkan data desa',
          backgroundColor: redy,
          titleText: Text(
            'Error',
            style: TextStyle(color: whitey, fontSize: fontSize.toDouble()),
          ),
          colorText: whitey);
    } finally {}
  }

  getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token').toString();
  }

  setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  // initApp() async => await profile.getUserProfile(getToken().toString());
}
