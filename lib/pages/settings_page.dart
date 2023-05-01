import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetResponsiveView {
  static const routeName = '/settings';
  static const pathName = '/home/settings';

  SettingsPage({super.key});

  @override
  Widget? desktop() {
    return const Scaffold(
      body: Center(child: Text("Settings")),
    );
  }

  @override
  Widget? phone() {
    return const Scaffold(
      body: Center(child: Text("Settings")),
    );
  }

  @override
  Widget? tablet() {
    return phone();
  }
}
