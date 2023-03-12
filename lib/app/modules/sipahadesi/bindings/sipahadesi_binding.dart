import 'package:get/get.dart';

import '../controllers/sipahadesi_controller.dart';

class SipahadesiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SipahadesiController>(
      () => SipahadesiController(),
    );
  }
}
