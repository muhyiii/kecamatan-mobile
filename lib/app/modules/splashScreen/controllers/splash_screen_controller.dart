import 'dart:async';
import 'dart:developer';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/bottomBar/views/bottom_bar_view.dart';
import 'package:sitforsa/app/modules/loginPage/views/login_page_view.dart';
import 'package:sitforsa/app/modules/splashScreen/views/splash_screen_view.dart';
import 'package:sitforsa/config/style.dart';

class SplashScreenController extends GetxController {
  var hasInternet = false.obs;
  final global = Get.put(GlobalController());
  late SharedPreferences prefs;

  final count = 0.obs;
  var opacity = 0.0.obs;
  @override
  void onInit() {
    super.onInit();

    SystemChannels.textInput.invokeMethod('TextInput.hide');
    checkInternet();
  }

  @override
  void onReady() {
    super.onReady();
    opacity.value = 1.0;
  }

  @override
  void onClose() {
    super.onClose();
  }

  checkInternet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final tokenString = prefs.getString('token').toString();
    var connectivityResult = await Connectivity().checkConnectivity();
    return JwtDecoder.isExpired(tokenString);
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return Timer(Duration(milliseconds: 3500), () {
        log(tokenString.toString());
        if (tokenString != null) {
          final isExpired = JwtDecoder.isExpired(tokenString);
          if (isExpired) {
            Get.defaultDialog(
                buttonColor: greeny,
                barrierDismissible: true,
                title: 'Sesi Loginmu Telah Berakhir',
                titleStyle: TextStyle(fontFamily: 'Helvetica Neue'),
                content: Text(
                  'Harap Login Kembali',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Helvetica Neue'),
                ),
                textConfirm: 'Ok',
                onConfirm: () => Get.offAll(() => SplashScreenView()),
                confirmTextColor: whitey,
                textCancel: 'Keluar',
                onCancel: () => Get.back(),
                cancelTextColor: greeny);
            prefs.clear();
            prefs.remove('token');
          } else {
            Get.off(() => BottomBarView(),
                duration: Duration(milliseconds: 1000),
                transition: Transition.rightToLeftWithFade);
          }
        } else {
          Get.off(() => LoginPageView(),
              duration: Duration(milliseconds: 1000),
              transition: Transition.rightToLeftWithFade);
        }
      });
    } else {
      return Get.defaultDialog(
          buttonColor: greeny,
          barrierDismissible: true,
          title: 'Internet dibutuhkan',
          titleStyle: TextStyle(fontFamily: 'Helvetica Neue'),
          content: Text(
            'Anda sedang offline',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Helvetica Neue'),
          ),
          textConfirm: 'Coba Lagi',
          onConfirm: () => Get.offAll(() => SplashScreenView()),
          confirmTextColor: whitey,
          textCancel: 'Keluar',
          onCancel: () => Get.back(),
          cancelTextColor: greeny);
    }
  }
}
