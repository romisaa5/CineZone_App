import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenshotSction extends StatelessWidget {
  const ScreenshotSction({super.key});
  static final List images = [
    'assets/images/screenshot.png',
    'assets/images/screenshot.png',
    'assets/images/screenshot.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 15.h,
      children: [
        SizedBox(height: 10.h),
        Text('Screen Shots', style: Styles.textStyle20),
        Column(
          spacing: 15.h,
          children: List.generate(
            images.length,
            (index) => Image.asset(
              images[index],
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
