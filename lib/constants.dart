import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const Color kScaffoldColor = Color(0xFF46DF77);
const Color kPrimaryColor = Color(0xFF10A45A);
const Color kSecondaryColor = Color(0xFF174729);
const Color kTextColor = Color(0xFFFFFFFF);

final kMargin = EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h);
final kPadding = EdgeInsets.all(2.h);
final kRadius = BorderRadius.circular(2.h);

Color setupColor(double percentage) {
  if (percentage >= 0.50) {
    return kScaffoldColor;
  } else if (percentage >= 0.25) {
    return Colors.orange;
  }
  return Colors.red;
}
