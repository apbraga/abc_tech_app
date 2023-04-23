import 'package:get/get.dart';

import '../controller/assistance_controller.dart';

class HomeBind extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => AssistanceController());
  }
}