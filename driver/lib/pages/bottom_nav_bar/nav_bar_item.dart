import 'package:driver/state/bottom_nav_bar/bottom_nav_logic.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class NavBarItem extends StatelessWidget {
  NavBarItem({
    super.key,
    required this.index,
    required this.label,
  });

  int index;
  String label;

  final logic = Get.find<BottomNavLogic>();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return GestureDetector(
        onTap: () => logic.changeTap(index),
        behavior: HitTestBehavior.translucent,
        child: Obx(() => Text(
              label,
              style: themeData.textTheme.bodySmall!.copyWith(
                fontSize: 20,
                color: logic.selectedTab == index
                    ? Colors.green
                    : const Color(0xff929292),
              ),
            )));
  }
}
