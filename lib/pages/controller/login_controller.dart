import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_flutter/global_controller/user_controller.dart';
import 'package:routing_flutter/pages/dashboard_pages.dart';
import 'package:routing_flutter/utils/shared_preferences_helper.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:35 pm
///
class LoginController extends GetxController {
  String? email, password;
  Rx<AutovalidateMode> autoValidateMode = Rx(AutovalidateMode.disabled);

  void emailSaved(String? value) {
    email = value?.trim();
  }

  void passwordSaved(String? value) {
    password = value?.trim();
  }

  void login(GlobalKey<FormState> formKey) {
    final state = formKey.currentState;
    if (state == null) return;
    if (state.validate()) {
      state.save();

      final redirectUrl = Get.parameters["redirectUrl"];
      if (email == "sunil@gmail.com" && password == "128") {
        SharedPreferenceHelper.storeAccessToken("sisira123");
        Get.find<UserController>().updateUser("sisira123");
        Get.offNamed(redirectUrl ?? DashboardPage.routeName);
      } else {
        log("invalid email");
      }
    } else {
      autoValidateMode.value = AutovalidateMode.always;
    }
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
