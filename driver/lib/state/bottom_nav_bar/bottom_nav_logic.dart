import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottomNavLogic extends GetxController {
  var selectedTab = 0.obs;

  void changeTap(int index) {
    print(index);
    selectedTab.value = index;
    print(selectedTab);
  }
}
