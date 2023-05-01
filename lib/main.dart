import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_flutter/app_configs/app_page_routes.dart';
import 'package:routing_flutter/pages/dashboard_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Routing',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      getPages: AppPageRoutes.routes,
      unknownRoute: AppPageRoutes.unknownRoute,
      routeInformationParser:
          GetInformationParser(initialRoute: DashboardPage.routeName),
      defaultTransition: Transition.fade,
    );
  }
}
