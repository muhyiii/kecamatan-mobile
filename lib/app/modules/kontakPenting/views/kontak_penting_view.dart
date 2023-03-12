import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/kontak_penting_controller.dart';

class KontakPentingView extends GetView<KontakPentingController> {
  const KontakPentingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Get.isDarkMode ? null : greenny,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? null : whitey,
        title: Text(
          'Kontak Penting',
          style: TextStyle(
            fontFamily: 'Product Sans',
          ),
        ),
        centerTitle: true,
      ),
      body:  Center(
        child: Text(
          'KontakPentingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
