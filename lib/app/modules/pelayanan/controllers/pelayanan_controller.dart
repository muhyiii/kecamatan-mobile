import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/data/Model/ModelBerita.dart';
import 'package:http/http.dart' as http;
import 'package:sitforsa/app/data/Model/ModelDataPelayanan.dart';
import 'package:sitforsa/config/style.dart';

class PelayananController extends GetxController {
  //TODO: Implement PelayananController
  final global = Get.put(GlobalController());
  var isLoading = false.obs;
  var dataPelayanan = List<Pelayanan>.empty().obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getPelayanan();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getPelayanan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading(true);
    update();
    try {
      final response =
          await http.get(Uri.parse(global.url + '/layanan'), headers: {
        'Authorization': 'Bearer ${prefs.getString('token').toString()}',
      });
      if (response.statusCode == 200) {
        ModelDataPelayanan data =
            modelDataPelayananFromJson(response.body.toString());
        dataPelayanan.value = data.data;
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
