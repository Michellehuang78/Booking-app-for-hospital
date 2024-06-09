import 'package:flutter_booking/app/router/app_navigator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final dayLabels = ['日', '一', '二', '三', '四', '五', '六'];

  void notification() {
    AppNavigator.startNotification();
  }

  void booking() {
    AppNavigator.startBooking();
  }

  void moment() {
    AppNavigator.startMoment();
  }

  void profile() {
    AppNavigator.startProfile();
  }

}
