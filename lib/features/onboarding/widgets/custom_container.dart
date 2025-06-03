import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:cinezone_app/core/widgets/custom_button.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key ?key,
    required this.title,
    required this.subtitle,
    required this.isback,
    this.onTapnext,
    this.onTapback,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final bool isback;
  final void Function()? onTapnext;
  final void Function()? onTapback;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 15.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: Styles.textStyle22),
              Text(
                subtitle,
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              CustomButton(
                textcolor: Colors.black,
                onTap: onTapnext,
                text: 'Next',
                color: AppColors.yellowcolor,
                width: double.infinity,
              ),
              isback
                  ? CustomButton(
                    textcolor: AppColors.yellowcolor,
                    onTap: onTapback,
                    text: 'Back',
                    color: Colors.black,
                    width: double.infinity,
                  )
                  : SizedBox(height: 1.h),
            ],
          ),
        ),
      ),
    );
  }
}
