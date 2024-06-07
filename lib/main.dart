import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';

void main() {
  // Initialize locale data
  initializeDateFormatting('zh_TW');

  runApp(const BookingApp());
}
