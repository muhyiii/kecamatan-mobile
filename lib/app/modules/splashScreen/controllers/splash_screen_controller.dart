import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/bottomBar/views/bottom_bar_view.dart';
import 'package:sitforsa/app/modules/loginPage/views/login_page_view.dart';
import 'package:sitforsa/app/modules/profile/controllers/profile_controller.dart';
import 'package:sitforsa/app/modules/splashScreen/views/splash_screen_view.dart';
import 'package:sitforsa/config/style.dart';

class SplashScreenController extends GetxController {
  final global = Get.put(GlobalController());
  final profileController = Get.put(ProfileController());
  late SharedPreferences prefs;

  var opacity = 0.0.obs;
  @override
  void onInit() async {
    ConnectivityResult? check;
    super.onInit();
    check = await Connectivity().checkConnectivity();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (check == ConnectivityResult.mobile ||
        check == ConnectivityResult.wifi) {
      global.isOnline(true);
      update();
    }
    checkToken();
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

  checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (global.isOnline.isTrue) {
      Timer(Duration(seconds: 3), () {
        if (token != null) {
          final isTokenExpired = JwtDecoder.isExpired(token);
          if (!isTokenExpired) {
            profileController.getUserProfile(token);
            Get.off(() => BottomBarView(),
                duration: Duration(milliseconds: 1000),
                transition: Transition.fade);
          } else {
            Get.dialog(
              barrierDismissible: false,
              transitionCurve: Curves.fastLinearToSlowEaseIn,
              AlertDialog(
                title: Text('Token Kadaluarsa'),
                content:
                    Text('Sesi Loginmu Telah Berakhir. Harap Login Kembali.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.offAll(() => LoginPageView(),
                          duration: Duration(milliseconds: 1000),
                          transition: Transition.leftToRightWithFade);
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(color: greeny),
                    ),
                  ),
                ],
              ),
            );
          }
        } else {
          Get.offAll(() => LoginPageView(),
              duration: Duration(milliseconds: 1000),
              transition: Transition.fadeIn);
        }
      });
    } else {
      return Get.dialog(
        barrierDismissible: false,
        transitionCurve: Curves.fastLinearToSlowEaseIn,
        AlertDialog(
          title: Text(
            'Offline',
          ),
          content: Text(
            'Aplikasi Membutuhkan Internet. Mohon Coba Lagi',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.deleteAll();
                onInit();
              },
              child: Text('OK', style: TextStyle(color: greeny)),
            ),
          ],
        ),
      );
    }
  }

  bool isExpired(String token) {
    final parts = token.split('.');
    final payload = parts[1];
    final decoded = String.fromCharCodes(base64Url.decode(payload));
    final Map<String, dynamic> data = jsonDecode(decoded);
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return data['exp'] < now;
  }

  // checkInternet() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final tokenString = prefs.getString('token').toString();
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   // return JwtDecoder.isExpired(tokenString);
  //   if (connectivityResult == ConnectivityResult.mobile ||
  //       connectivityResult == ConnectivityResult.wifi) {
  //     return Timer(Duration(milliseconds: 3500), () {
  //       log(tokenString.toString());
  //       if (tokenString != null) {
  //         final isExpired = JwtDecoder.isExpired(tokenString);
  //         if (isExpired) {
  //           Get.defaultDialog(
  //               buttonColor: greeny,
  //               barrierDismissible: true,
  //               title: 'Sesi Loginmu Telah Berakhir',
  //               titleStyle: TextStyle(fontFamily: 'Helvetica Neue'),
  //               content: Text(
  //                 'Harap Login Kembali',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(fontFamily: 'Helvetica Neue'),
  //               ),
  //               textConfirm: 'Ok',
  //               onConfirm: () => Get.offAll(() => SplashScreenView()),
  //               confirmTextColor: whitey,
  //               textCancel: 'Keluar',
  //               onCancel: () => Get.back(),
  //               cancelTextColor: greeny);
  //           prefs.clear();
  //           prefs.remove('token');
  //         } else {
  //           Get.off(() => BottomBarView(),
  //               duration: Duration(milliseconds: 1000),
  //               transition: Transition.rightToLeftWithFade);
  //         }
  //       } else {
  //         Get.off(() => LoginPageView(),
  //             duration: Duration(milliseconds: 1000),
  //             transition: Transition.rightToLeftWithFade);
  //       }
  //     });
  //   } else {
  //     return Get.defaultDialog(
  //         buttonColor: greeny,
  //         barrierDismissible: true,
  //         title: 'Internet dibutuhkan',
  //         titleStyle: TextStyle(fontFamily: 'Helvetica Neue'),
  //         content: Text(
  //           'Anda sedang offline',
  //           textAlign: TextAlign.center,
  //           style: TextStyle(fontFamily: 'Helvetica Neue'),
  //         ),
  //         textConfirm: 'Coba Lagi',
  //         onConfirm: () => Get.offAll(() => SplashScreenView()),
  //         confirmTextColor: whitey,
  //         textCancel: 'Keluar',
  //         onCancel: () => Get.back(),
  //         cancelTextColor: greeny);
  //   }
  // }
}
