import 'package:driver/pages/bottom_nav_bar/bottom_nav_bar%20.dart';
import 'package:driver/pages/home_screen.dart';
import 'package:driver/pages/map/map.dart';
import 'package:driver/state/bottom_nav_bar/bottom_nav_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final navLogic = Get.find<BottomNavLogic>();
  final List<Widget> screen = [const HomeScreen(), MapScreen()];

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screen[navLogic.selectedTab.value]),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
