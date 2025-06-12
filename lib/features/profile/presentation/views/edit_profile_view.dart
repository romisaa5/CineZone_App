import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:cinezone_app/core/utils/app_router.dart';
import 'package:cinezone_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  void _showBottomSheet(BuildContext context, String title, String hintText) {
    final TextEditingController oldPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final TextEditingController nameController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20.w,
            right: 20.w,
            top: 20.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text(title, style: Styles.textStyle18)),
              SizedBox(height: 12.h),
              if (title == 'Change Password') ...[
                TextField(
                  controller: oldPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter current password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.forgetPassword);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: AppColors.yellowcolor),
                    ),
                  ),
                ),
                TextField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter new password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm new password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ] else ...[
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ],
              SizedBox(height: 16.h),
              CustomButton(
                text: 'Update',
                color: AppColors.yellowcolor,
                width: double.infinity,
                onTap: () {
                  if (title == 'Change Password') {
                    if (newPasswordController.text !=
                        confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Passwords do not match")),
                      );
                      return;
                    }
                  }

                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 15.h),
            ],
          ),
        );
      },
    );
  }

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
        padding: EdgeInsets.all(16.0.h),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
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
                _showBottomSheet(context, 'Change Name', 'Enter your new name');
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
                _showBottomSheet(
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
