import 'package:driver/pages/home_screen.dart';
import 'package:driver/pages/main_scree.dart';
import 'package:driver/state/bottom_nav_bar/bottom_nav_logic.dart';
import 'package:driver/state/contract/contract_logic.dart';
import 'package:driver/state/home/home_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialBinding: InitBining(),
        home: const MainScreen(),
      );
    }));
  }
}

class InitBining extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavLogic());
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => ContractLogic());
    // TODO: implement dependencies
  }
}
