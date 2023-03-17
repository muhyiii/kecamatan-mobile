import 'package:get/get.dart';

import 'package:sitforsa/app/modules/berita/controllers/berita_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => BeritaController());
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
