import 'package:flutter/material.dart';
import 'package:flutter_booking/app/config/app_color.dart';
import 'package:flutter_booking/app/config/app_size.dart';
import 'package:flutter_booking/app/config/app_text_style.dart';
import 'package:flutter_booking/app/extensions/extensions.dart';
import 'package:flutter_booking/presentation/widgets/touch_close_soft_keyboard.dart';
import 'package:get/get.dart';
import 'package:flutter_booking/presentation/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCtrl = Get.find<LoginController>();
    return Scaffold(
      body: TouchCloseSoftKeyboard(
        child: Stack(
          children: [
            _buildLoginHeader(),
            SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    326.heightBox(),
                    Obx(
                          () => _buildLoginForm(
                        phoneCtrl: loginCtrl.phoneCtrl,
                        pwdCtrl: loginCtrl.pwdCtrl,
                        obscureText: loginCtrl.obscureText.value,
                        toggleEye: loginCtrl.toggleEye,
                        onTapLogin: () {},
                        onTapForgetPwd: () {},
                      ),
                    ),
                    75.heightBox(),
                    _buildSignUp(
                      onTapSignUp: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSignUp({required Function onTapSignUp}) => SizedBox(
  width: screenWidth,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      children: [
        Text(
          '第一次使用本服務？ ',
          style: AppTextStyle.mediumSizeRegularWeight(
            color: AppColorExtension('#14304A'),
          ),
        ),
        smallVerticalSpace,
        GestureDetector(
          onTap: () => onTapSignUp.call(),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(massiveRadius),
                border: Border.all(
                    color: AppColor.lightGray,
                    width: 1,
                    style: BorderStyle.solid)),
            child: Center(
              child: Text(
                '建立帳號',
                style: AppTextStyle.xLargeSizeBoldWeight(
                  color: AppColor.defaultTxtClr,
                ),
              ),
            ),
          ),
        ),
        24.heightBox(),
      ],
    ),
  ),
);

Widget _buildLoginForm({
  required TextEditingController phoneCtrl,
  required TextEditingController pwdCtrl,
  required bool obscureText,
  required Function toggleEye,
  required Function onTapLogin,
  required Function onTapForgetPwd,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '手機號碼',
            style: AppTextStyle.smallSizeSemiBoldWeight(
              color: AppColor.defaultTxtClr,
            ),
          ),
          smallVerticalSpace,
          TextField(
            controller: phoneCtrl,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            style: AppTextStyle.xxLargeSizeBoldWeight(
              color: AppColor.defaultTxtClr,
            ),
            decoration: InputDecoration(
              hintText: '09XXXXXXXX',
              hintStyle: AppTextStyle.xxLargeSizeBoldWeight(
                color: AppColor.hintTxtClr,
              ),
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.hintTxtClr,
                  width: 1.0,
                ),
              ),
            ),
          ),
          mediumVerticalSpace,
          Text(
            '密碼',
            style: AppTextStyle.smallSizeSemiBoldWeight(
              color: AppColor.defaultTxtClr,
            ),
          ),
          smallVerticalSpace,
          TextField(
            controller: pwdCtrl,
            keyboardType: TextInputType.text,
            obscureText: obscureText,
            textInputAction: TextInputAction.done,
            style: AppTextStyle.xxLargeSizeBoldWeight(
              color: AppColor.defaultTxtClr,
            ),
            decoration: InputDecoration(
              hintText: '輸入密碼',
              hintStyle: AppTextStyle.xxLargeSizeBoldWeight(
                color: AppColor.hintTxtClr,
              ),
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.hintTxtClr,
                  width: 1.0,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColor.hintTxtClr,
                ),
                onPressed: () => toggleEye.call(),
              ),
            ),
          ),
          massiveVerticalSpace,
          GestureDetector(
            onTap: () => onTapLogin.call(),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: AppColor.btnClr,
                borderRadius: BorderRadius.circular(massiveRadius),
              ),
              child: Center(
                child: Text(
                  '登入',
                  style: AppTextStyle.xLargeSizeBoldWeight(
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
          ),
          regularVerticalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => onTapForgetPwd.call(),
              child: SizedBox(
                width: 93,
                height: 29,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 6,
                      child: Container(
                        width: 93,
                        height: 9,
                        color: AppColorExtension('#FD969C'),
                      ),
                    ),
                    Center(
                      child: Text(
                        '忘記密碼',
                        style: AppTextStyle.xLargeSizeRegularWeight(
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );

Widget _buildLoginHeader() => Stack(
  children: [
    _buildCircleShape(
      topPosition: -37,
      leftPosition: 235,
      size: 398,
      color: AppColorExtension('#E4DB7C'),
    ),
    _buildCircleShape(
      topPosition: -433,
      leftPosition: -184,
      size: 700,
      color: AppColorExtension('#8A4C7D'),
    ),
    _buildCircleShape(
      topPosition: -313,
      leftPosition: -163,
      size: 398,
      color: AppColorExtension('#FD969C'),
    ),
    Positioned(
      top: kToolbarHeight + 49,
      left: 24,
      child: SizedBox(
        width: screenWidth - 48,
        child: Text(
          'Welcome to Booking App',
          style: AppTextStyle.customTextStyle(
            fontSize: 46,
            color: AppColor.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
  ],
);

Widget _buildCircleShape({
  required double topPosition,
  required double leftPosition,
  required double size,
  required Color color,
}) =>
    Positioned(
      top: topPosition,
      left: leftPosition,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
