import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/router/app_page.dart';

class BookingApp extends StatelessWidget {
  const BookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPage.routes,
      initialRoute: AppRoute.home,
    );
  }
}
