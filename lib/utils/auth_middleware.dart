import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_flutter/global_controller/user_controller.dart';
import 'package:routing_flutter/pages/dashboard_pages.dart';
import 'package:routing_flutter/pages/login_page.dart';
import 'package:routing_flutter/utils/shared_preferences_helper.dart';

class AuthCheckMiddleware extends GetMiddleware {
  @override
  Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
    final userController = Get.isRegistered<UserController>()
        ? Get.find<UserController>()
        : Get.put<UserController>(UserController(), permanent: true);
    final token = SharedPreferenceHelper.accessToken;
    if (token != null && token.isNotEmpty) {
      userController.updateUser(token);
      return route;
    } else {
      if (route.pageSettings?.path == LoginPage.routeName) {
        return route;
      } else {
        return RouteDecoder.fromRoute(
            LoginPage.getPath(route.pageSettings?.path));
      }
    }
  }
}

class NoAuthCheckMiddleware extends GetMiddleware {
  @override
  Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
    final userController = Get.isRegistered<UserController>()
        ? Get.find<UserController>()
        : Get.put<UserController>(UserController(), permanent: true);
    final token = SharedPreferenceHelper.accessToken;
    if (token != null) {
      userController.updateUser(token);
      return RouteDecoder.fromRoute(DashboardPage.routeName);
    } else {
      return route;
    }
  }
}
