import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    this.onTap,
    required this.width,
    required this.textcolor,
  });
  final String text;
  final Color textcolor;
  final Color color;
  final double width;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 48.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.yellowcolor),
          borderRadius: BorderRadius.circular(16.r),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.textStyle16.copyWith(color: textcolor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
