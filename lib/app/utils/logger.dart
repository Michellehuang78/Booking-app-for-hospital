import 'dart:developer';

class AppLog {
  AppLog._();

  static void print(dynamic text, {bool isError = false}) {
    log('** $text, isError [$isError]', name: 'Booking-App');
  }
}
