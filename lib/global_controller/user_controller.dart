import 'package:get/get.dart';
import 'package:routing_flutter/pages/login_page.dart';
import 'package:routing_flutter/pages/models/user_model.dart';
import 'package:routing_flutter/utils/shared_preferences_helper.dart';

class UserController extends GetxController with StateMixin<String?> {
  void updateUser(String user) {
    change(GetStatus.success(user));
  }
}

class UserBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Get.put(UserController() as Bind)];
  }
}
