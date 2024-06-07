import 'package:flutter/material.dart';
import 'package:flutter_booking/app/mixins/home_mixin.dart';
import 'package:flutter_booking/presentation/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_booking/app/config/app_color.dart';
import 'package:flutter_booking/app/config/app_size.dart';
import 'package:flutter_booking/app/config/app_text_style.dart';
import 'package:flutter_booking/app/extensions/extensions.dart';

class HomePage extends GetView<HomeController> with HomeMixin {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '我的行事曆',
          style: AppTextStyle.xxLargeSizeSemiBoldWeight(
            color: AppColor.defaultTxtClr,
          ),
        ),
      ),
      endDrawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.heightBox(),
              RichText(
                text: TextSpan(
                  style: AppTextStyle.customTextStyle(
                    color: AppColorExtension("#252525"),
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: month,
                    ),
                    TextSpan(
                      text: '\t$year',
                      style: AppTextStyle.customTextStyle(
                        color: AppColorExtension("#252525"),
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              mediumVerticalSpace,
              _buildCalendar(
                labels: controller.dayLabels,
                today: int.parse(day),
                firstDayOfWeek: firstDayOfWeek,
                daysInPreviousMonth: daysInPreviousMonth,
                daysInMonth: daysInMonth,
                daysInNextMonth: daysInNextMonth,
              ),
              massiveVerticalSpace,
              SizedBox(
                width: screenWidth,
                height: 29,
                child: Stack(
                  children: [
                    Positioned(
                      left: (((screenWidth - 48) / 2) - (163 / 2)),
                      bottom: 6,
                      child: Container(
                        width: 163,
                        height: 9,
                        color: AppColorExtension('#FD969C'),
                      ),
                    ),
                    Center(
                      child: Text(
                        '下次上課：1/15（一）',
                        style: AppTextStyle.xLargeSizeRegularWeight(
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCalendar({
  required List<String> labels,
  required int today,
  required int firstDayOfWeek,
  required int daysInPreviousMonth,
  required int daysInMonth,
  required int daysInNextMonth,
}) {
  final int daysInWeek = labels.length;
  final double dayPerWidth = (screenWidth - 48) / daysInWeek;
  int colCount = (daysInMonth / daysInWeek).ceil();
  if (firstDayOfWeek != 0) {
    colCount += 1;
  }
  final double calendarHeight = screenHeight * .5;
  final double dayPerHeight = calendarHeight / colCount;
  return Container(
    child: Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 28,
          child: Row(
            children: List.generate(
              daysInWeek,
              (index) => Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                width: dayPerWidth,
                child: Center(
                  child: Text(labels[index]),
                ),
              ),
            ),
          ),
        ),
        mediumVerticalSpace,
        Column(
          children: List.generate(colCount, (colIndex) {
            return IntrinsicHeight(
              child: Row(
                children: List.generate(daysInWeek, (rowIndex) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    width: dayPerWidth,
                    height: dayPerHeight,
                    child: Center(
                      child: _buildDate(
                        colIndex: colIndex,
                        rowIndex: rowIndex,
                        today: today,
                        firstDayOfWeek: firstDayOfWeek,
                        daysInWeek: daysInWeek,
                        daysInPreviousMonth: daysInPreviousMonth,
                        daysInMonth: daysInMonth,
                        daysInNextMonth: daysInNextMonth,
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        )
      ],
    ),
  );
}

Widget _buildDate({
  required int colIndex,
  required int rowIndex,
  required int today,
  required int firstDayOfWeek,
  required int daysInWeek,
  required int daysInPreviousMonth,
  required int daysInMonth,
  required int daysInNextMonth,
}) {
  // 计算当前单元格在整个日历中的索引
  int cellIndex = colIndex * daysInWeek + rowIndex;
  // 计算当前单元格应显示的日期
  int currentDay = cellIndex - firstDayOfWeek + 1;
  // 如果当前单元格的索引小于0，表示在上个月的日期
  if (currentDay <= 0) {
    return Text(
      '${currentDay + daysInPreviousMonth}',
      style: AppTextStyle.customTextStyle(
        color: AppColorExtension('#252525'),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
  // 如果当前单元格的索引大于当前月份的天数，表示在下个月的日期
  else if (currentDay > daysInMonth) {
    return Text(
      '${currentDay - daysInMonth}',
      style: AppTextStyle.customTextStyle(
        color: AppColorExtension('#252525'),
        opacity: .6,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
  // 否则，显示当前月份的日期
  else if (today == currentDay) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: AppColorExtension('#FD969C'),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$currentDay',
          style: AppTextStyle.smallSizeRegularWeight(
            color: AppColor.white,
          ),
        ),
      ),
    );
  } else {
    return Text(
      '$currentDay',
      style: AppTextStyle.smallSizeRegularWeight(
        color: AppColor.black,
      ),
    );
  }
}

Widget _buildDrawer() => Drawer(
      shape: const RoundedRectangleBorder(),
      backgroundColor: AppColor.drawerBgClr,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: Get.back,
                child: Icon(
                  Icons.close,
                  size: 24,
                  color: AppColor.white,
                ),
              ),
              massiveVerticalSpace,
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: <Widget>[
                    _buildDrawerItem(
                      label: "通知",
                      onTapLabel: () {},
                    ),
                    _buildDrawerItem(
                      label: "預約補課／諮詢",
                      onTapLabel: () {},
                    ),
                    _buildDrawerItem(
                      label: "成長點滴",
                      onTapLabel: () {},
                    ),
                    _buildDrawerItem(
                      label: "我的帳號",
                      onTapLabel: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget _buildDrawerItem({
  required String label,
  required Function onTapLabel,
}) =>
    GestureDetector(
      onTap: () => onTapLabel.call(),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: Center(
          child: Text(
            label,
            style: AppTextStyle.largeSizeBoldWeight(
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
