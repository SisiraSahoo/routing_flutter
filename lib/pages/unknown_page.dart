import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownPage extends GetResponsiveView {
  static const routeName = '/404';
  static const pathName = '/dashboard/404';

  UnknownPage({super.key});
  @override
  Widget? desktop() {
    return Scaffold(
      body: Center(child: Text("404")),
    );
  }

  @override
  Widget? phone() {
    return Scaffold(
      body: Center(child: Text("404")),
    );
  }

  @override
  Widget? tablet() {
    return phone();
  }
}
