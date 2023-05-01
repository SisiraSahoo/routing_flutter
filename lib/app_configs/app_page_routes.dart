import 'package:get/get.dart';
import 'package:routing_flutter/pages/controller/dashboard_controller.dart';
import 'package:routing_flutter/pages/controller/home_controller.dart';
import 'package:routing_flutter/pages/dashboard_pages.dart';
import 'package:routing_flutter/pages/explore_page.dart';
import 'package:routing_flutter/pages/home_page.dart';
import 'package:routing_flutter/pages/login_page.dart';
import 'package:routing_flutter/pages/profile_page.dart';
import 'package:routing_flutter/pages/settings_page.dart';
import 'package:routing_flutter/pages/splash_page.dart';
import 'package:routing_flutter/pages/unknown_page.dart';
import 'package:routing_flutter/utils/auth_middleware.dart';

class AppPageRoutes {
  static final unknownRoute = GetPage(
      name: UnknownPage.routeName,
      page: () => const UnknownPage(),
      participatesInRootNavigator: true,
      preventDuplicates: true);
  static final routes = [
    GetPage(
        name: SplashPage.routeName,
        page: () => SplashPage(),
        participatesInRootNavigator: true,
        preventDuplicates: true,
        transition: Transition.noTransition,
        children: [
          GetPage(
            name: LoginPage.routeName,
            page: () => LoginPage(),
            participatesInRootNavigator: true,
            binding: DashboardBinding(),
            preventDuplicates: true,
            transition: Transition.noTransition,
            middlewares: [
              NoAuthCheckMiddleware(),
            ],
          ),
          GetPage(
              name: DashboardPage.routeName,
              page: () => DashboardPage(),
              binding: DashboardBinding(),
              participatesInRootNavigator: true,
              preventDuplicates: true,
              transition: Transition.noTransition,
              middlewares: [
                AuthCheckMiddleware(),
              ],
              children: [
                GetPage(
                  name: SettingsPage.routeName,
                  page: () => SettingsPage(),
                  participatesInRootNavigator: true,
                ),
                GetPage(
                  name: HomePage.routeName,
                  page: () => HomePage(),
                  binding: HomeBinding(),
                  participatesInRootNavigator: true,
                ),
                GetPage(
                  name: ExplorePage.routeName,
                  page: () => ExplorePage(),
                  participatesInRootNavigator: true,
                ),
                GetPage(
                  name: ProfilePage.routeName,
                  page: () => ProfilePage(),
                  participatesInRootNavigator: true,
                ),
              ]),
        ]),
  ];
}
