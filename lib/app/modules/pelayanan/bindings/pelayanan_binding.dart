import 'package:get/get.dart';

import '../controllers/pelayanan_controller.dart';

class PelayananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PelayananController>(
      () => PelayananController(),
    );
  }
}
