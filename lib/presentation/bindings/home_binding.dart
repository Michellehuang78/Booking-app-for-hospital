import 'package:get/get.dart';
import 'package:flutter_booking/presentation/controllers/login_controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
