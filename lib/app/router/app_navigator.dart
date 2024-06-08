import 'package:get/get.dart';
import 'app_page.dart';

class AppNavigator {
  static void backToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  static void startForgetPwd() {
    Get.toNamed(AppRoute.forgetPwd);
  }

  static void startSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  static void startHome() {
    Get.offAllNamed(AppRoute.home);
  }

  static void startNotification() {
    Get.toNamed(AppRoute.notification);
  }

  static void startBooking() {
    Get.toNamed(AppRoute.booking);
  }

  static void startMoment() {
    Get.toNamed(AppRoute.moment);
  }

  static void startProfile() {
    Get.toNamed(AppRoute.profile);
  }
}
