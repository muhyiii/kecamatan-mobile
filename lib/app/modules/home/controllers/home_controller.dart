import 'dart:async';

import 'package:get/get.dart';
import 'package:sitforsa/app/modules/dashboard/views/dashboard_view.dart';


class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
