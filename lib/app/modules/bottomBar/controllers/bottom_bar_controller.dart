import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/profile/controllers/profile_controller.dart';

class BottomBarController extends GetxController {
  final profileController = Get.put(ProfileController());
  // final global = Get.put(GlobalController());

  final count = 0.obs;
  var tabIndex = 0.obs;

  // void changeTabIndex(int index, context) {
  //   if (index == 4) profileController.initApp;
  //   if (index == 2) global.reqPermissionNotification(context);
  //   tabIndex.value = index;
  //   // print("index => ${tabIndex.value}");
  //   update();
  //   print(index);
  // }

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
