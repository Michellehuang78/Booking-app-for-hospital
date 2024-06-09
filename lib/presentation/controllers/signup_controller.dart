import 'package:flutter/material.dart';
import 'package:flutter_booking/app/router/app_navigator.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final childNameCtrl = TextEditingController();
  final parentNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();
  final confirmPwdCtrl = TextEditingController();
  final pwdObscureText = true.obs;
  final confirmPwdObscureText = true.obs;
  final isSelRadioBtn = false.obs;

  void pwdToggleEye() {
    pwdObscureText.value = !pwdObscureText.value;
  }

  void confirmPwdToggleEye() {
    confirmPwdObscureText.value = !confirmPwdObscureText.value;
  }

  void setSelRadio() {
    isSelRadioBtn.value = !isSelRadioBtn.value;
  }

  void signUp() {
    AppNavigator.startHome();
    // if (childNameCtrl.text.isEmpty) {
    //   Get.snackbar('App', 'Child Name is Empty');
    // } else if (parentNameCtrl.text.isEmpty) {
    //   Get.snackbar('App', 'Parent Name is Empty');
    // } else if (phoneCtrl.text.isEmpty) {
    //   Get.snackbar('App', 'Phone is Empty');
    // } else if (emailCtrl.text.isEmpty) {
    //   Get.snackbar('App', 'Email is Empty');
    // } else if (pwdCtrl.text.isEmpty) {
    //   Get.snackbar('App', 'Password is Empty');
    // } else if (confirmPwdCtrl.text.isEmpty) {
    //   Get.snackbar('App', 'Confirm Password is Empty');
    // } else if (pwdCtrl.text != confirmPwdCtrl.text) {
    //   Get.snackbar('App', 'Password and confirm password does not match');
    // } else {
    //   AppNavigator.startHome();
    // }
  }
}
