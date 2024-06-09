import 'package:flutter/material.dart';
import 'package:flutter_booking/app/router/app_navigator.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final phoneCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();
  final obscureText = true.obs;

  void toggleEye() {
    obscureText.value = !obscureText.value;
  }

  void login() {
    // TODO: login action
    AppNavigator.startHome();
  }

  void forgetPwd() {
    // TODO: navigate to forget password page
  }

  void signUp() {
    AppNavigator.startSignUp();
  }
}
