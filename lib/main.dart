import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sitforsa/app/modules/splashScreen/controllers/splash_screen_controller.dart';
import 'package:sitforsa/config/style.dart';

import 'firebase_options.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  Get.put(
    SplashScreenController(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
