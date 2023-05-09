import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/notifikasi/controllers/notifikasi_controller.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize('resource://drawable/icon_notif', [
    NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Inbox Notification',
        channelDescription: 'Notification For SIPAOJOL',
        importance: NotificationImportance.High,
        defaultColor: Colors.red,
        criticalAlerts: true,
        enableLights: true,
        enableVibration: true,
        channelShowBadge: true)
  ]);
  final global = Get.put(GlobalController());
  // final notif = Get.put(() => NotifikasiController());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.instance.subscribeToTopic('news');

  await FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("onMessage: $message");
    // Extract notification data and show notification using awesome_notifications
    showAwesomeNotification(
      title: message.data['title'],
      body: message.data['deskripsi'],
    );
  });

  // Configure FCM message handler when app is in background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Background message handler for FCM

  // FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
  //   // createPlantFoodNotification();
  //   await AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //           id: 1,
  //           channelKey: 'Notification',
  //           // color: greenny,
  //           title: jsonEncode(message!.data['nama']),
  //           backgroundColor: blacky,
  //           body: 'Ini Berita Terbaru Locch'));
  //   print("message recieved");
  //   log("ini pesannnya on message " + message.toString());
  //   print(message.runtimeType);
  // });
  // await FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
  //   print('Message clicked!');
  //   log("ini pesannnya " + message.toString());
  // });

  // FirebaseMessaging.instance
  //     .getInitialMessage()
  //     .then((RemoteMessage? message) async {
  //   print('ini pesan');
  //   await AwesomeNotifications().createNotification(
  //     content: NotificationContent(
  //       id: 2,
  //       channelKey: 'Notification',
  //       title: '${Emojis.animals_boar + Emojis.plant_cactus} Buy Plant Food!!!',
  //       body: jsonEncode(message),
  //       // bigPicture: 'assets://images/img.article.jpeg',
  //       notificationLayout: NotificationLayout.BigPicture,
  //     ),
  //   );
  // });
  // FirebaseMessaging.onBackgroundMessage(firebaseMessage);

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

showAwesomeNotification({required String title, required String body}) async {
  // Define notification content
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title:
          '${Emojis.money_money_bag + Emojis.plant_cactus} Buy Plant Food!!!',
      body:
          'Kurir Ekspedisi Dibegal di Bekasi, Dibacok Setelah Tolak Serahkan Tas dan HP',
      bigPicture: 'asset://assets/images/logo.png',
      notificationLayout: NotificationLayout.BigPicture,
    ),
  );
}

createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(1);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("onBackgroundMessage: $message");
  // Extract notification data and show notification using awesome_notifications
  showAwesomeNotification(
    title: message.data['title'],
    body: message.data['deskripsi'],
  );
}

// Future firebaseMessage(RemoteMessage message) async {
//   await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//           id: 1,
//           channelKey: 'Notification',
//           title: 'te',
//           backgroundColor: blacky,
//           body: 'Ini Berita Terbaru Locch'));
// }

// Future<void> createPlantFoodNotification() async {
//   await AwesomeNotifications().createNotification(
//     content: NotificationContent(
//       id: 3,
//       channelKey: 'basic_channel',
//       title:
//           '${Emojis.money_money_bag + Emojis.plant_cactus} Buy Plant Food!!!',
//       body: 'Florist at 123 Main St. has 2 in stock.',
//       bigPicture: 'assets://assets/notification_map.png',
//       notificationLayout: NotificationLayout.BigPicture,
//     ),
//   );
// }
