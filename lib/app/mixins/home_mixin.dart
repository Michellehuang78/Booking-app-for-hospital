import 'package:flutter_booking/app/extensions/extensions.dart';
import 'package:intl/intl.dart';

mixin HomeMixin {
  String get day => DateFormat('d').format(DateTime.now());

  String get month => DateFormat('M月', 'zh_TW').format(DateTime.now());

  String get year => DateFormat('yyyy').format(DateTime.now());

  // 获取上个月的最后一天
  int get daysInPreviousMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month, 0).day;
  }

  int get daysInMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 1, 0).day;
  }

  // 获取下个月的第一天
  int get daysInNextMonth {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 2, 0).day;
  }

  int get firstDayOfWeek {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    return firstDayOfMonth.weekday;
  }
}
