import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gelir_gider_app/modules/dashboard/dashboard_page.dart';
import 'package:gelir_gider_app/modules/home/home_controller.dart';
import 'package:gelir_gider_app/modules/profile/profile_page.dart';
import 'package:gelir_gider_app/themes/app_colors.dart';
import 'package:get/get.dart';

abstract class IconsList {
  static const List<IconData> icons = [
    Icons.dashboard_customize_outlined,
    Icons.person,
  ];
}

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gelir Gider App"),
        actions: [
          IconButton(
            onPressed: () {
              controller.googleCikisYap();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [DashboardPage(), ProfilePage()],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.darkHotPink,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          size: 32, // icon size
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar.builder(
          backgroundColor: AppColors.darkTiffanyBlue,
          itemCount: IconsList.icons.length,
          tabBuilder: (index, isActive) {
            final color = isActive ? Colors.white : Colors.white70;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconsList.icons[index],
                  size: isActive ? 22 : 16, // bigger if active
                  color: color,
                ),
                if (isActive)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            );
          },
          activeIndex: controller.currentIndex.value,
          gapLocation: GapLocation.center,
          splashColor: Colors.white,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) => controller.changeIndex(index),
        ),
      ),
    );
  }
}
