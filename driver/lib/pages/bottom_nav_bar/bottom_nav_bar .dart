import 'package:driver/pages/bottom_nav_bar/nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});

  List<Widget> navBars = [
    NavBarItem(
      index: 0,
      label: "Home",
    ),
    NavBarItem(
      index: 1,
      label: "Map",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 1,
        left: 1,
        right: 1,
      ),
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: Container(
        height: 75,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(
          left: 32,
          right: 32,
          bottom: 16,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: navBars,
          ),
        ),
      ),
    );
  }
}
