import 'package:flutter/material.dart';
import 'package:flutter_booking/app/config/app_color.dart';
import 'package:flutter_booking/app/config/app_text_style.dart';
import 'package:flutter_booking/app/extensions/extensions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Container()),
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
              width: MediaQuery.of(context).size.width - 48,
              child: Text(
                'Welcome to Booking App',
                style: AppTextStyle.customTextStyle(
                  fontSize: 46,
                  color: AppColor.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}

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
