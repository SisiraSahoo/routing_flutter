import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_flutter/pages/controller/dashboard_controller.dart';
import 'package:routing_flutter/pages/explore_page.dart';
import 'package:routing_flutter/pages/home_page.dart';
import 'package:routing_flutter/pages/profile_page.dart';
import 'package:routing_flutter/pages/settings_page.dart';

class DashboardPage extends GetResponsiveView<DashboardController> {
  static const routeName = '/dashboard';

  DashboardPage({super.key});
  @override
  Widget? desktop() {
    return GetRouterOutlet.builder(
        routerDelegate: Get.nestedKey(DashboardPage.routeName),
        builder: (context) {
          final delegate = context.navigation;
          final currentLocation = context.location;
          int currentIndex = 0;
          if (currentLocation.startsWith(ExplorePage.routeName) == true) {
            currentIndex = 1;
          }
          if (currentLocation.startsWith(ProfilePage.routeName) == true) {
            currentIndex = 2;
          }
          return Scaffold(
              body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationRail(
                  selectedIndex: currentIndex,
                  onDestinationSelected: (value) {
                    switch (value) {
                      case 0:
                        delegate.toNamed(DashboardPage.routeName);
                        break;
                      case 1:
                        delegate.toNamed(ExplorePage.routeName);
                        break;
                      case 1:
                        delegate.toNamed(SettingsPage.routeName);
                        break;
                      case 2:
                        delegate.toNamed(ProfilePage.routeName);
                        break;
                      default:
                    }
                  },
                  labelType: NavigationRailLabelType.selected,
                  backgroundColor: Get.theme.primaryColor,
                  destinations: const <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.explore_outlined),
                      selectedIcon: Icon(Icons.explore_rounded),
                      label: Text('Explore'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      selectedIcon: Icon(Icons.settings),
                      label: Text('Setting'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person_outline_rounded),
                      selectedIcon: Icon(Icons.person_rounded),
                      label: Text('Profile'),
                    ),
                  ],
                  selectedIconTheme: const IconThemeData(color: Colors.white),
                  unselectedIconTheme: const IconThemeData(color: Colors.black),
                  selectedLabelTextStyle: const TextStyle(color: Colors.white),
                ),
                Expanded(
                  child: GetRouterOutlet(
                    anchorRoute: DashboardPage.routeName,
                    initialRoute: HomePage.routeName,
                  ),
                ),
              ],
            ),
          ));
        });
  }

  @override
  Widget? phone() {
    return GetRouterOutlet.builder(
      routerDelegate: Get.nestedKey(null),
      builder: (context) {
        final delegate = context.navigation;
        final currentLocation = context.location;
        int currentIndex = 0;
        if (currentLocation.startsWith(ExplorePage.routeName) == true) {
          currentIndex = 1;
        }
        if (currentLocation.startsWith(ProfilePage.routeName) == true) {
          currentIndex = 2;
        }
        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                switch (value) {
                  case 0:
                    delegate.toNamed(HomePage.routeName);
                    break;
                  case 1:
                    delegate.toNamed(ExplorePage.routeName);
                    break;
                  case 2:
                    delegate.toNamed(SettingsPage.routeName);
                    break;
                  case 3:
                    delegate.toNamed(ProfilePage.routeName);
                    break;
                  default:
                }
              },
              currentIndex: currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  activeIcon: Icon(Icons.explore_rounded),
                  label: ('Explore'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  activeIcon: Icon(Icons.settings),
                  label: ('Setting'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  activeIcon: Icon(Icons.person_rounded),
                  label: ('Profile'),
                ),
              ],
            ),
            body: GetRouterOutlet(
              anchorRoute: DashboardPage.routeName,
              initialRoute: HomePage.routeName,
            ));
      },
    );
  }

  @override
  Widget? tablet() {
    return phone();
  }
}
