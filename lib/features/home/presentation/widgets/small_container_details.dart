import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallContainerDetails extends StatelessWidget {
  const SmallContainerDetails({
    super.key,
    required this.value,
    required this.icon,
  });
  final num value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.h,
      height: 40.w,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        spacing: 5.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.yellowcolor),
          Text(value.toString(), style: Styles.textStyle18),
        ],
      ),
    );
  }
}
