import 'package:flutter/material.dart';
import 'package:flutter_booking/presentation/controllers/moment_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_booking/app/config/app_color.dart';
import 'package:flutter_booking/app/config/app_size.dart';
import 'package:flutter_booking/app/config/app_text_style.dart';
import 'package:flutter_booking/app/extensions/extensions.dart';

class MomentPage extends GetView<MomentController> {
  const MomentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      _buildMomentItem(
                        avatar:
                            'https://www.w3schools.com/w3images/avatar1.png',
                        name: 'User name',
                        images: [
                          'https://www.w3schools.com/w3images/avatar2.png',
                          'https://www.w3schools.com/w3images/avatar3.png',
                          'https://www.w3schools.com/w3images/avatar4.png',
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: 79,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColorExtension("#FAFAFA"),
                  boxShadow: [
                    BoxShadow(
                      color: AppColorExtension("#A6A6AA"),
                      offset: const Offset(0, -0.33),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColorExtension("#262626"),
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 22,
                      color: AppColorExtension("#262626"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildMomentItem({
  required String avatar,
  required String name,
  required List<String> images,
}) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(avatar),
                fit: BoxFit.contain,
              ),
              shape: BoxShape.circle,
            ),
          )
        ],
      )
    ],
  );
}
