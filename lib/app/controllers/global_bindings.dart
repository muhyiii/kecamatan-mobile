import 'package:get/get.dart';
import 'package:sitforsa/app/modules/berita/controllers/berita_controller.dart';
import 'package:sitforsa/app/modules/home/controllers/home_controller.dart';
import 'package:sitforsa/app/modules/notifikasi/controllers/notifikasi_controller.dart';
import 'package:sitforsa/app/modules/pelayanan/controllers/pelayanan_controller.dart';
import 'package:sitforsa/app/modules/profile/controllers/profile_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BeritaController());
    Get.lazyPut(() => PelayananController());
    Get.lazyPut(() => NotifikasiController());
    Get.lazyPut(() => ProfileController());
    // tambahkan semua controller yang akan di-load di sini
  }
}
