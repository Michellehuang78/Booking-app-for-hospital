import 'package:flutter/material.dart';
import 'package:flutter_booking/presentation/controllers/notification_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_booking/app/config/app_color.dart';
import 'package:flutter_booking/app/config/app_size.dart';
import 'package:flutter_booking/app/config/app_text_style.dart';
import 'package:flutter_booking/app/extensions/extensions.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            labelColor: AppColor.tabSelTxtClr,
            unselectedLabelColor: AppColor.tabNorTxtClr,
            labelStyle: AppTextStyle.xLargeSizeRegularWeight(
              color: AppColor.tabNorTxtClr,
            ),
            indicatorColor: AppColor.tabSelTxtClr,
            indicatorWeight: 2,
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            tabs: const [
              Tab(text: "全部"),
              Tab(text: "課程"),
              Tab(text: "預約"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildNotificationItem(),
            const Center(child: Text("目前沒有新的課程通知喔！")),
            _buildNotificationItem(),
          ],
        ),
      ),
    );
  }
}

Widget _buildNotificationItem() => ListView(
      padding: const EdgeInsets.all(24),
      children: List.generate(
        2,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColor.lightGray,
                    shape: BoxShape.circle,
                  ),
                ),
                smallHorizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '職能張老師',
                        style: AppTextStyle.smallSizeSemiBoldWeight(
                          color: AppColor.black,
                        ),
                      ),
                      Text(
                        '1/17（三）11:00 調課預約成功',
                        style: AppTextStyle.smallSizeSemiBoldWeight(
                          color: AppColorExtension("#212121"),
                        ),
                      ),
                    ],
                  ),
                ),
                smallHorizontalSpace,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                  decoration: BoxDecoration(
                    color: AppColor.tabSelTxtClr,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '我知道了',
                    style: AppTextStyle.mediumSizeSemiBoldWeight(
                      color: AppColor.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
