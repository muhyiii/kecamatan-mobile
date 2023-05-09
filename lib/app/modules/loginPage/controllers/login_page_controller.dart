import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/data/Model/ModelDesa.dart';
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
  var dataDesa = List<Desa>.empty().obs;
  var id_desa;
  var token;

  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();

    FirebaseMessaging.instance.getToken().then((value) => token = value);
    getDesa();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  getDesa() async {
    try {
      final response = await http.get(Uri.parse(global.url + '/desa'));

      if (response.statusCode == 200) {
        ModelDesa data = modelDesaFromJson(response.body.toString());
        dataDesa.value = data.data;
      } else {
        throw Exception('Gagal untuk mendapatkan data desa');
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        titleText: Text(
          'Kesalahan',
          style: TextStyle(color: global.isDark.value ? whitey : redy),
        ),
        messageText: Text(
          'Gagal Mendapatkan Data Desa.',
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
      print(e);
    }
  }

  register() async {
    isLoading(true);
    update();
    try {
      final response = await http.post(
        Uri.parse(global.url + "/penduduk/register"),
        body: json.encode({
          'nik': nik.text,
          'nama': nama.text,
          'password': password.text,
          "id_desa": id_desa,
          "token": token.toString()
        }),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      log(token.toString());
      if (response.statusCode == 200) {
        global.setToken(json.decode(response.body)['token']);
        Get.showSnackbar(GetSnackBar(
          titleText: Text(
            'Berhasil',
            style: TextStyle(color: global.isDark.value ? whitey : greeny),
          ),
          messageText: Text(
            'Anda Berhasil Login.',
            style: TextStyle(color: global.isDark.value ? whitey : greeny),
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
        profile.getUserProfile(jsonDecode(response.body)['token'].toString());
        Timer(Duration(milliseconds: 750), () {
          Get.offAll(() => BottomBarView(),
              duration: Duration(milliseconds: 1500),
              transition: Transition.rightToLeftWithFade);
          Timer(Duration(seconds: 4), () {
            isLoading(false);
            update();
          });
        });
      } else {
        // response gagal, tampilkan error message
        isLoading(false);
        update();
        Get.showSnackbar(GetSnackBar(
          titleText: Text(
            'Kesalahan',
            style: TextStyle(color: global.isDark.value ? whitey : redy),
          ),
          messageText: Text(
            json.decode(response.body)['message'].toString(),
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
      }
    } catch (e) {
      isLoading(false);
      update();
      log(e.toString());
      Get.showSnackbar(GetSnackBar(
        titleText: Text(
          'Kesalahan',
          style: TextStyle(color: global.isDark.value ? whitey : redy),
        ),
        messageText: Text(
          'Coba Beberapa Saat Lagi.',
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
        Get.showSnackbar(GetSnackBar(
          titleText: Text(
            'Berhasil',
            style: TextStyle(color: global.isDark.value ? whitey : greeny),
          ),
          messageText: Text(
            'Anda Berhasil Login.',
            style: TextStyle(color: global.isDark.value ? whitey : greeny),
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
        profile.getUserProfile(jsonDecode(response.body)['token'].toString());
        Timer(Duration(milliseconds: 750), () {
          Get.offAll(
            () => BottomBarView(),
            duration: Duration(milliseconds: 1000),
          );
          Timer(Duration(seconds: 4), () {
            isLoading(false);
            update();
          });
        });
      } else {
        isLoading(false);
        update();
        Get.showSnackbar(GetSnackBar(
          titleText: Text(
            'Kesalahan',
            style: TextStyle(color: global.isDark.value ? whitey : redy),
          ),
          messageText: Text(
            json.decode(response.body)['message'].toString(),
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
        //   json.decode(response.body)['message'].toString(),
        //   colorText: redy,
        //   backgroundColor: whitey,
        //   titleText: Text(
        //     'Error',
        //     style:
        //         TextStyle(color: whitey, fontSize: global.fontSize.toDouble()),
        //   ),
        // );
      }
    } catch (e) {
      isLoading(false);
      update();
      Get.showSnackbar(GetSnackBar(
        titleText: Text(
          'Kesalahan',
          style: TextStyle(color: global.isDark.value ? whitey : redy),
        ),
        messageText: Text(
          'Coba Beberapa Saat Lagi.',
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
    }
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear(); // menghapus semua data dari shared preferences
    Get.deleteAll();
    Get.offAll(
      () => SplashScreenView(),
    );
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (prefs.containsKey('token')) prefs.remove('token');
    // Timer(Duration(milliseconds: 500), () {
    //   Get.offAll(
    //     () => SplashScreenView(),
    //   );
    // });
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
