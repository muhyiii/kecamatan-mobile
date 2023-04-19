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
  var dataBeritaFilter;
  final isSearch = false.obs;

  var total_page = 0.obs;
  var page = 1.obs;
  var textInput = TextEditingController().obs;
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
    // global.reqPermissionNotification();
  }

  @override
  void onClose() {}

  runFilter() {
    print(textInput == '');
    List<Berita> results = [];
    if (textInput != "") {
      results = dataBerita
          .where((user) => user.judul
              .toLowerCase()
              .contains(textInput.value.text.toLowerCase()))
          .toList();
      dataBerita.value = results;
    }

    print(results);
  }

  getBerita() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading(true);
    update();
    try {
      final response = await http.get(
          Uri.parse(global.url + '/berita' + '?page=$page&limit=5'),
          headers: {
            'Authorization': 'Bearer ${prefs.getString('token').toString()}',
          });
      if (response.statusCode == 200) {
        ModelBerita data = modelBeritaFromJson(response.body.toString());
        total_page.value = data.totalPage;
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
