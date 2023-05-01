import 'package:get/get.dart';

class DashboardController extends GetxController {}

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
