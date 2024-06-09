import 'package:flutter/material.dart';
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



  void signUp() {}
}
