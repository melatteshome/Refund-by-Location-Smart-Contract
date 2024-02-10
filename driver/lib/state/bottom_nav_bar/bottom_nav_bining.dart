import 'package:driver/state/bottom_nav_bar/bottom_nav_logic.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class BottomNavBinind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavLogic());
    // TODO: implement dependencies
  }
}
