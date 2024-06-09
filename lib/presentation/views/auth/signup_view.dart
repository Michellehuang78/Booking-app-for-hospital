import 'package:flutter/material.dart';
import 'package:flutter_booking/presentation/controllers/signup_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_booking/app/config/app_color.dart';
import 'package:flutter_booking/app/config/app_size.dart';
import 'package:flutter_booking/app/config/app_text_style.dart';
import 'package:flutter_booking/app/extensions/extensions.dart';
import 'package:flutter_booking/presentation/widgets/touch_close_soft_keyboard.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TouchCloseSoftKeyboard(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.heightBox(),
                GestureDetector(
                  onTap: Get.back,
                  child: const Icon(Icons.arrow_back_ios),
                ),
                29.heightBox(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '建立帳號',
                          style: AppTextStyle.customTextStyle(
                            color: AppColor.defaultTxtClr,
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '一鍵安排治療時間！',
                          style: AppTextStyle.customTextStyle(
                            color: AppColor.defaultTxtClr,
                            fontSize: 34,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        75.heightBox(),
                        _buildSignUpTextField(
                          ctrl: controller.childNameCtrl,
                          hintTxt: '小孩姓名？',
                        ),
                        mediumVerticalSpace,
                        _buildSignUpTextField(
                          ctrl: controller.parentNameCtrl,
                          hintTxt: '你的姓名？',
                        ),
                        mediumVerticalSpace,
                        _buildSignUpTextField(
                          ctrl: controller.phoneCtrl,
                          hintTxt: '手機號碼',
                        ),
                        mediumVerticalSpace,
                        _buildSignUpTextField(
                          ctrl: controller.emailCtrl,
                          hintTxt: 'Email',
                        ),
                        mediumVerticalSpace,
                        Obx(
                          () => _buildSignUpTextField(
                            ctrl: controller.pwdCtrl,
                            hintTxt: '設定密碼',
                            suffix: true,
                            obscureText: controller.pwdObscureText.value,
                            toggleEye: controller.pwdToggleEye,
                          ),
                        ),
                        mediumVerticalSpace,
                        Obx(
                          () => _buildSignUpTextField(
                            ctrl: controller.confirmPwdCtrl,
                            hintTxt: '再輸入一次密碼',
                            suffix: true,
                            obscureText: controller.confirmPwdObscureText.value,
                            toggleEye: controller.confirmPwdToggleEye,
                          ),
                        ),
                        29.heightBox(),
                        Row(
                          children: [
                            Obx(
                              () => GestureDetector(
                                onTap: controller.setSelRadio,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: controller.isSelRadioBtn.value
                                        ? AppColorExtension('#7ED321')
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: AppColor.lightGray,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Visibility(
                                    visible: controller.isSelRadioBtn.value,
                                    child: Center(
                                      child: Container(
                                        width: 12,
                                        height: 12,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            smallHorizontalSpace,
                            Text(
                              '我第一次來馬偕兒醫',
                              style: AppTextStyle.xLargeSizeMediumWeight(
                                color: AppColor.defaultTxtClr,
                              ),
                            ),
                          ],
                        ),
                        92.heightBox(),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              style: AppTextStyle.customTextStyle(
                                color: AppColor.defaultTxtClr,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              children: <TextSpan>[
                                const TextSpan(
                                  text: '已有帳號？\t',
                                ),
                                TextSpan(
                                  text: '立即登入',
                                  style: AppTextStyle.customTextStyle(
                                    color: AppColor.defaultTxtClr,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        regularVerticalSpace,
                        GestureDetector(
                          onTap: controller.signUp,
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColor.btnClr,
                              borderRadius:
                                  BorderRadius.circular(massiveRadius),
                            ),
                            child: Center(
                              child: Text(
                                '建立帳號',
                                style: AppTextStyle.xLargeSizeBoldWeight(
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildSignUpTextField({
  required TextEditingController ctrl,
  required String hintTxt,
  bool suffix = false,
  bool? obscureText,
  Function? toggleEye,
}) =>
    TextField(
      controller: ctrl,
      keyboardType: TextInputType.text,
      obscureText: obscureText ?? false,
      textInputAction: TextInputAction.next,
      style: AppTextStyle.xxLargeSizeBoldWeight(
        color: AppColor.defaultTxtClr,
      ),
      decoration: InputDecoration(
        hintText: hintTxt,
        hintStyle: AppTextStyle.largeSizeMediumWeight(
          color: AppColor.hintTxtClr,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColor.hintTxtClr,
            width: 1,
          ),
        ),
        suffixIcon: suffix
            ? IconButton(
                icon: Icon(
                  (suffix && (obscureText ?? true))
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColor.hintTxtClr,
                ),
                onPressed: () => toggleEye?.call(),
              )
            : null,
      ),
    );
