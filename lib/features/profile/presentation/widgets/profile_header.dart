import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:cinezone_app/core/utils/app_router.dart';
import 'package:cinezone_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        spacing: 25.h,
        children: [
          SizedBox(height: 15.h),
          Row(
            spacing: 15.w,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/avatars/(8).png'),
              ),
              Column(
                spacing: 8.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('John Safwat', style: Styles.textStyle18),
                  Row(
                    spacing: 5.w,
                    children: [
                      Text('12', style: Styles.textStyle18),
                      SizedBox(width: 4),
                      Text('Wish List', style: Styles.textStyle16),
                      SizedBox(width: 16),
                      Text('10', style: Styles.textStyle18),
                      SizedBox(width: 4),
                      Text('History', style: Styles.textStyle16),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.editprofileview);
                },
                textcolor: Colors.white,
                isborder: false,
                width: MediaQuery.of(context).size.width * .5,
                text: 'Edit Profile',
                color: AppColors.yellowcolor,
              ),
              CustomButton(
                textcolor: Colors.white,
                isborder: false,
                width: MediaQuery.of(context).size.width * .3,
                text: 'Exit ↩',
                color: AppColors.redcolor,
                onTap: () {
                  GoRouter.of(context).go(AppRouter.loginView);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
