import 'package:bombs_and_pairs/views/app/consts/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingTextStyle {
  static const TextStyle introduction = TextStyle(
    fontFamily: 'Inter',
    fontSize: 19.0,
    fontWeight: FontWeight.w600,
    color: AppColors.greenColor,
  );
  static const TextStyle description = TextStyle(
      fontFamily: 'Inter',
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      height: 24 / 15);
}
