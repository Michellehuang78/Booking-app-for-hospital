import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking/app/config/app_color.dart';
import 'package:flutter_booking/app/config/app_size.dart';
import 'package:flutter_booking/app/config/app_text_style.dart';
import 'package:flutter_booking/app/extensions/extensions.dart';
import 'package:flutter_booking/presentation/widgets/touch_close_soft_keyboard.dart';


class MomentController extends GetxController {
  final description = TextEditingController();

  void addPost() {
    Get.bottomSheet(
      isScrollControlled: true,
      TouchCloseSoftKeyboard(
        child: DraggableScrollableSheet(
          initialChildSize: .85,
          minChildSize: .85,
          maxChildSize: .85,
          expand: false,
          builder: (context, scrollController) => Container(
            width: screenWidth,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    '分享一則成長故事',
                    style: AppTextStyle.xxLargeSizeSemiBoldWeight(
                      color: AppColor.defaultTxtClr,
                    ),
                  ),
                ),
                36.heightBox(),
                Text(
                  '上傳照片',
                  style: AppTextStyle.xLargeSizeMediumWeight(
                    color: AppColor.defaultTxtClr,
                  ),
                ),
                regularVerticalSpace,
                GestureDetector(
                  onTap: selectPhotos,
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
                        '從手機上傳',
                        style: AppTextStyle.xLargeSizeBoldWeight(
                          color: AppColor.defaultTxtClr,
                        ),
                      ),
                    ),
                  ),
                ),
                36.heightBox(),
                Text(
                  '照片故事',
                  style: AppTextStyle.xLargeSizeMediumWeight(
                    color: AppColor.defaultTxtClr,
                  ),
                ),
                regularVerticalSpace,
                TextField(
                  controller: description,
                  maxLines: 3,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  style: AppTextStyle.mediumSizeMediumWeight(
                    color: AppColor.defaultTxtClr,
                  ),
                  decoration: InputDecoration(
                    hintText: '想紀錄些什麼呢？',
                    hintStyle: AppTextStyle.mediumSizeMediumWeight(
                      color: AppColor.hintTxtClr,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 24,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                regularVerticalSpace,
                const Spacer(),
                GestureDetector(
                  onTap: post,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColor.btnClr,
                      borderRadius: BorderRadius.circular(massiveRadius),
                    ),
                    child: Center(
                      child: Text(
                        '分享',
                        style: AppTextStyle.xLargeSizeBoldWeight(
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
                massiveVerticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectPhotos() {}

  // 分享
  void post() {}
}
