import 'package:flutter/material.dart';
import 'package:flutter_booking/presentation/controllers/booking_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_booking/app/config/app_color.dart';
import 'package:flutter_booking/app/config/app_size.dart';
import 'package:flutter_booking/app/config/app_text_style.dart';
import 'package:flutter_booking/app/extensions/extensions.dart';

class BookingPage extends GetView<BookingController> {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            (screenHeight / 4).heightBox(),
            Center(
              child: Text(
                '尚未預約補課堂數：1 堂',
                style: AppTextStyle.xLargeSizeMediumWeight(
                  color: AppColor.defaultTxtClr,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            18.heightBox(),
            GestureDetector(
              onTap: controller.bookClass,
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
                    '預約補課',
                    style: AppTextStyle.xLargeSizeBoldWeight(
                      color: AppColor.defaultTxtClr,
                    ),
                  ),
                ),
              ),
            ),
            massiveVerticalSpace,
            GestureDetector(
              onTap: controller.phoneCall,
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColor.btnClr,
                  borderRadius: BorderRadius.circular(massiveRadius),
                ),
                child: Center(
                  child: Text(
                    '預約電話諮詢',
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
    );
  }
}
