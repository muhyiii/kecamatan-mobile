import 'package:get/get.dart';
import 'package:sitforsa/app/modules/berita/controllers/berita_controller.dart';
import 'package:sitforsa/app/modules/home/controllers/home_controller.dart';
import 'package:sitforsa/app/modules/notifikasi/controllers/notifikasi_controller.dart';
import 'package:sitforsa/app/modules/pelayanan/controllers/pelayanan_controller.dart';
import 'package:sitforsa/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(
      () => BottomBarController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
    Get.put(() => BeritaController());
    Get.lazyPut<PelayananController>(() => PelayananController());
    Get.lazyPut<NotifikasiController>(() => NotifikasiController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
