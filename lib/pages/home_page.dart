import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_flutter/pages/controller/home_controller.dart';

class HomePage extends GetResponsiveView<HomeController> {
  static const routeName = '/home';
  static const pathName = '/dashboard/home';

  HomePage({super.key});
  @override
  Widget? desktop() {
    return Scaffold(
      body: Center(child: Text("Home")),
    );
  }

  @override
  Widget? phone() {
    return Scaffold(
      body: Center(child: Text("Home")),
    );
  }

  @override
  Widget? tablet() {
    return phone();
  }
}
