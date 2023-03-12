import 'package:get/get.dart';

import '../controllers/detail_pelayanan_controller.dart';

class DetailPelayananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPelayananController>(
      () => DetailPelayananController(),
    );
  }
}
