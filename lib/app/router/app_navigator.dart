import 'package:get/get.dart';
import 'app_page.dart';

class AppNavigator {
  static void backToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  static void startSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  static void startHome() {
    Get.offAllNamed(AppRoute.home);
  }
}
