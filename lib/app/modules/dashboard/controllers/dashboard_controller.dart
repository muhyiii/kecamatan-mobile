import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  String name = 'Nurdin Cibodas';

  final count = 0.obs;
  // DateTime now = DateTime.now();
  final formattedDate =
      DateFormat('EEEE, MMM d, yyyy').format(DateTime.now()).obs;

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
