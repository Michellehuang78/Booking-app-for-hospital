import 'package:flutter/material.dart';

extension CustomBox on int {
  Widget widthBox() {
    return SizedBox(
      width: toDouble(),
    );
  }

  Widget heightBox() {
    return SizedBox(
      height: toDouble(),
    );
  }
}