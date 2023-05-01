import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_flutter/pages/dashboard_pages.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 11:24 pm
///
class SplashPage extends GetResponsiveView {
  static const routeName = '/';

  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RouterOutlet.builder(
      delegate: Get.nestedKey(null),
      builder: (context) {
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: DashboardPage.routeName,
            delegate: Get.nestedKey(null),
            anchorRoute: '/',
            filterPages: (afterAnchor) {
              return afterAnchor.take(1);
            },
          ),
        );
      },
    );
  }
}
