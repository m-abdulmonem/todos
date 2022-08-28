import 'package:get/get.dart';

import '../../../futures/home/presentations/manager/home_controller.dart';


class Binding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    // Get.lazyPut(() => MainController());
    // Get.lazyPut(() => BoardingController());
  }

}