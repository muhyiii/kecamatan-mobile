import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengajuanController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement PengajuanController
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Menunggu'),
    Tab(text: 'Diproses'),
    Tab(text: 'Selesai'),
    Tab(text: 'Ditolak'),
  ];
  late TabController controller;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
