import 'package:get/get.dart';

class HomeController extends GetxController {}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
