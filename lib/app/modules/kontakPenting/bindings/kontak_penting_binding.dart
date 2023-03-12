import 'package:get/get.dart';

import '../controllers/kontak_penting_controller.dart';

class KontakPentingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KontakPentingController>(
      () => KontakPentingController(),
    );
  }
}
