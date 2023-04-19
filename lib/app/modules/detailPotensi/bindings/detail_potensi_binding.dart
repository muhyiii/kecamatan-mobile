import 'package:get/get.dart';

import '../controllers/detail_potensi_controller.dart';

class DetailPotensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPotensiController>(
      () => DetailPotensiController(),
    );
  }
}
