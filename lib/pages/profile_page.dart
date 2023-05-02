import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_flutter/global_controller/user_controller.dart';
import 'package:routing_flutter/pages/login_page.dart';
import 'package:routing_flutter/utils/shared_preferences_helper.dart';

class ProfilePage extends GetResponsiveView<UserController> {
  static const routeName = '/profile';
  static const pathName = '/dashboard/profile';

  ProfilePage({super.key});
  @override
  Widget? desktop() {
    return middleComponent(controller);
  }

  @override
  Widget? phone() {
    return middleComponent(controller);
  }

  @override
  Widget? tablet() {
    return phone();
  }
}

Widget middleComponent(UserController controller) {
  return Scaffold(
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome to My Profile",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
              onPressed: () {
                SharedPreferenceHelper.logout();
                Get.offAllNamed(LoginPage.routeName);
              },
              child: const Text("Logout"))
        ],
      ),
    ),
  );
}
