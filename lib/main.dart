import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/splashScreen/controllers/splash_screen_controller.dart';
import 'package:sitforsa/config/style.dart';

import 'firebase_options.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    bottomAppBarColor: Colors.cyan,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.cyan,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    bottomAppBarColor: Colors.deepPurple,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}

void main() async {
  final global = Get.put(GlobalController());
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.instance.getToken().then((e) => print(e));

  FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
    print("message recieved");
    log("ini pesannnya on message " + message.toString());
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
    print('Message clicked!');
    log("ini pesannnya " + message.toString());
  });

  FirebaseMessaging.instance
      .getInitialMessage()
      .then((RemoteMessage? message) =>log("ini initial " + message.toString()));

  FirebaseMessaging.onBackgroundMessage(_firebaseMessage);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: ThemeData(fontFamily: 'Helvetica Neue'),
      darkTheme: ThemeData.dark(),
      themeMode: global.isDark.value ? ThemeMode.dark : ThemeMode.light,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> _firebaseMessage(RemoteMessage message) async {
  log("ini background " + message.toString());
  await Firebase.initializeApp();
}
