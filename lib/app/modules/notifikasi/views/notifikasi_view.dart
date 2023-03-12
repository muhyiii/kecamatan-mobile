import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Get.isDarkMode ? null : greenny,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? null : whitey,
        title: Text(
          'Notifikasi',
          style: TextStyle(fontFamily: 'Helvetica Neue Bold'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NotifikasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
