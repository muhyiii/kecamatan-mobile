import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotifikasiController extends GetxController {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    super.onInit();
    // configureFCM();
  }

  void configureFCM() {
    // Request permission for displaying notifications (only for iOS)
    if (Platform.isIOS) {
      _firebaseMessaging.requestPermission(
          alert: true, badge: true, sound: true);
    }

    // Configure FCM message handler when app is in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: $message");
      // Extract notification data and show notification using awesome_notifications
      showAwesomeNotification(
        title: message!.data['title'],
        body: message!.data['deskripsi'],
      );
    });

    // Configure FCM message handler when app is in background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // Background message handler for FCM
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("onBackgroundMessage: $message");
    // Extract notification data and show notification using awesome_notifications
    showAwesomeNotification(
      title: message!.data['title'],
      body: message!.data['deskripsi'],
    );
  }

  void showAwesomeNotification({required String title, required String body}) {
    // Define notification content
    NotificationContent content = NotificationContent(
      id: 1,
      channelKey: 'Notifikasi',
      title: title,
      body: body,
      notificationLayout: NotificationLayout.Default,
      payload: {
        'data': 'additional data',
      },
    );

    // Create and show the notification
    AwesomeNotifications().createNotification(content: content);
  }
}
