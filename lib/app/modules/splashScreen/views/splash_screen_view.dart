import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  final controller = Get.put(SplashScreenController());
  var global = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: Get.width / 2),
        color: greeny,
        child: Obx(() => AnimatedOpacity(
              curve: Curves.easeInBack,
              duration: Duration(milliseconds: 2500),
              opacity: controller.opacity.value,
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: Get.width / 4,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'SIPAOJOL',
                      style: TextStyle(
                          fontSize: Get.width / 12,
                          fontFamily: 'Prompt',
                          color: whitey),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
