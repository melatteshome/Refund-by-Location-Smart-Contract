import 'package:driver/state/contract/contract_logic.dart';
import 'package:get/instance_manager.dart';

class ContractBininds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContractLogic());
    // TODO: implement dependencies
  }
}
