import 'package:get/get.dart';

import '../controllers/potensi_desa_controller.dart';

class PotensiDesaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PotensiDesaController>(
      () => PotensiDesaController(),
    );
  }
}
