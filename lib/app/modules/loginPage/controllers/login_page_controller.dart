import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/bottomBar/views/bottom_bar_view.dart';
import 'package:sitforsa/app/modules/profile/controllers/profile_controller.dart';
import 'package:sitforsa/app/modules/splashScreen/views/splash_screen_view.dart';
import 'package:sitforsa/config/style.dart';

class LoginPageController extends GetxController {
  var global = Get.put(GlobalController());
  var profile = Get.put(ProfileController());
  TextEditingController nik = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController password = TextEditingController();
  var id_desa;

  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
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

  register() async {
    // data yang akan dikirim
    isLoading(true);
    update();

    // endpoint untuk POST request
    try {
      // kirim POST request ke backend
      final response = await http.post(
        Uri.parse(global.url + "/penduduk/register"),
        body: json.encode({
          'nik': nik.text,
          'nama': nama.text,
          'password': password.text,
          "id_desa": id_desa
        }),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      // cek response status code
      if (response.statusCode == 200) {
        global.setToken(json.decode(response.body)['token']);
        // response berhasil, tampilkan body response
        Get.snackbar('Success', 'Data berhasil dikirim',
            backgroundColor: greeny);
        profile.getUserProfile(jsonDecode(response.body)['token'].toString());
        Timer(Duration(milliseconds: 750), () {
          Get.offAll(() => BottomBarView(),
              duration: Duration(milliseconds: 1500),
              transition: Transition.rightToLeftWithFade);
          isLoading(false);
          update();
        });
      } else {
        // response gagal, tampilkan error message
        isLoading(false);
        update();
        Get.snackbar('Error', json.decode(response.body)['message'].toString(),
            backgroundColor: redy,
            titleText: Text(
              'Error',
              style: TextStyle(
                  color: whitey, fontSize: global.fontSize.toDouble()),
            ),
            colorText: whitey);
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar('Error', 'Ada kesalahan, coba beberapa saat lagi',
          backgroundColor: redy,
          titleText: Text(
            'Error',
            style:
                TextStyle(color: whitey, fontSize: global.fontSize.toDouble()),
          ),
          colorText: whitey);
    }
  }

  login() async {
    isLoading(true);
    update();
    try {
      final response = await http.post(
        Uri.parse(global.url + "/penduduk/login"),
        body: json.encode({
          'nik': nik.text,
          'password': password.text,
        }),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        global.setToken(json.decode(response.body)['token']);
        Get.snackbar('Success', 'Data berhasil dikirim',
            backgroundColor: greeny);
        profile.getUserProfile(jsonDecode(response.body)['token'].toString());
        Timer(Duration(milliseconds: 750), () {
          Get.offAll(() => BottomBarView(),
              duration: Duration(milliseconds: 1500),
              transition: Transition.rightToLeftWithFade);
          isLoading(false);
          update();
        });
      } else {
        isLoading(false);
        update();
        Get.snackbar('Error', json.decode(response.body)['message'].toString(),
            backgroundColor: redy,
            titleText: Text(
              'Error',
              style: TextStyle(
                  color: whitey, fontSize: global.fontSize.toDouble()),
            ),
            colorText: whitey);
      }
    } catch (e) {
      isLoading(false);
      update();
      Get.snackbar('Error', 'Ada kesalahan, coba beberapa saat lagi',
          backgroundColor: redy,
          titleText: Text(
            'Error',
            style:
                TextStyle(color: whitey, fontSize: global.fontSize.toDouble()),
          ),
          colorText: whitey);
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) prefs.remove('token');
    Timer(Duration(milliseconds: 500), () {
      Get.offAll(() => SplashScreenView());
    });
  }

  // login(String text, String password) async {
  //   // data yang akan dikirim
  //   isLoading = true;
  //   update();
  //   final data = {
  //     'nik': text,
  //     'password': password,
  //   };
  //   // endpoint untuk POST request
  //   try {
  //     // kirim POST request ke backend

  //     final response = await http.post(
  //       Uri.parse(url + '/login'),
  //       body: json.encode(data),
  //       headers: {
  //         'Content-type': 'application/json',
  //         'Accept': 'application/json',
  //       },
  //     );
  //     print(response);
  //     // cek response status code
  //     if (response.statusCode == 200) {
  //       // response berhasil, tampilkan body response
  //       print(response.body);
  //     } else {
  //       // response gagal, tampilkan error message
  //       Get.defaultDialog(
  //           content: Text(response.body),
  //           title: 'Gagal',
  //           titleStyle:
  //               TextStyle(fontSize: global.fontSize.value, color: redy));
  //       print('Error: ${response.reasonPhrase}');
  //     }
  //   } catch (e) {
  //     Get.defaultDialog(
  //       title: 'Gagal',
  //     );
  //   }
  // }
}
