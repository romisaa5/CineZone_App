import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDevider extends StatelessWidget {
  const CustomDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30.w, left: 30.w),
      child: Row(
        children: [
          Expanded(child: Divider(color: AppColors.yellowcolor, thickness: .5)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "  OR  ",
              style: Styles.textStyle14.copyWith(color: AppColors.yellowcolor),
            ),
          ),
          Expanded(child: Divider(color: AppColors.yellowcolor, thickness: .5)),
        ],
      ),
    );
  }
}
