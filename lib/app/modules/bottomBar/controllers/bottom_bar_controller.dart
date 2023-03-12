import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_bindings.dart';
import 'package:sitforsa/app/modules/profile/controllers/profile_controller.dart';

class BottomBarController extends GetxController {
  final profileController = Get.put(ProfileController());

  final count = 0.obs;
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    if (index == 4) profileController.initApp;
    tabIndex.value = index;
    update();
    print(index);
  }

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
