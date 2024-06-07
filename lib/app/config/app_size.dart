import 'package:get/get.dart';
import 'package:flutter/material.dart';

const double _tiny = 4.0;
const double _small = 12.0;
const double _regular = 14.0;
const double _medium = 16.0;
const double _large = 20.0;
const double _veryLarge = 24.0;
const double _massive = 32.0;

const double tinyRadius = 4.0;
const double smallRadius = 8.0;
const double largeRadius = 20.0;
const double massiveRadius = 32.0;

double screenWidth = Get.mediaQuery.size.width;

double screenHeight = Get.mediaQuery.size.height;

const SizedBox noSpace = SizedBox.shrink();

const SizedBox tinyVerticalSpace = SizedBox(
  height: _tiny,
);

const SizedBox smallVerticalSpace = SizedBox(
  height: _small,
);

const SizedBox regularVerticalSpace = SizedBox(
  height: _regular,
);

const SizedBox mediumVerticalSpace = SizedBox(
  height: _medium,
);

const SizedBox largeVerticalSpace = SizedBox(
  height: _large,
);

const SizedBox veryLargeVerticalSpace = SizedBox(
  height: _veryLarge,
);

const SizedBox massiveVerticalSpace = SizedBox(
  height: _massive,
);

const SizedBox tinyHorizontalSpace = SizedBox(
  width: _tiny,
);

const SizedBox smallHorizontalSpace = SizedBox(
  width: _small,
);

const SizedBox regularHorizontalSpace = SizedBox(
  width: _regular,
);

const SizedBox mediumHorizontalSpace = SizedBox(
  width: _medium,
);

const SizedBox largeHorizontalSpace = SizedBox(
  width: _large,
);

const SizedBox veryLargeHorizontalSpace = SizedBox(
  width: _veryLarge,
);

const SizedBox massiveHorizontalSpace = SizedBox(
  width: _massive,
);
