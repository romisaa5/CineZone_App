import 'package:cinezone_app/core/helper/show_models_bottom_profile_view.dart';
import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  ShowModelsBottomProfileView.showAvatarPickerBottomSheet(
                    context,
                  );
                },
                child: Text(
                  'Pick Avatar',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/avatars/(8).png'),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Personal Information',
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5.h),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.person, color: AppColors.yellowcolor),
              ),
              title: Text('Change Name', style: Styles.textStyle16),
              trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
              onTap: () {
                ShowModelsBottomProfileView.showBottomSheet(
                  context,
                  'Change Name',
                  'Enter your new name',
                );
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.lock_outline, color: AppColors.yellowcolor),
              ),
              title: Text('Change Password', style: Styles.textStyle16),
              trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
              onTap: () {
                ShowModelsBottomProfileView.showBottomSheet(
                  context,
                  'Change Password',
                  'Enter your new password',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
