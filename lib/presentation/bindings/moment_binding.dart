import 'package:flutter_booking/presentation/controllers/moment_controller.dart';
import 'package:get/get.dart';

class MomentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MomentController());
  }
}
