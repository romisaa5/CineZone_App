import 'dart:async';
import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:cinezone_app/core/utils/app_router.dart';
import 'package:cinezone_app/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EmailVerifiedView extends StatefulWidget {
  const EmailVerifiedView({super.key});

  @override
  State<EmailVerifiedView> createState() => _EmailVerifiedViewState();
}

class _EmailVerifiedViewState extends State<EmailVerifiedView> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
  }

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      timer?.cancel();
      if (!mounted) return;
      GoRouter.of(context).pushReplacement(AppRouter.homeview);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text('Email Verification', style: Styles.textStyle24),
            SizedBox(height: 20.h),
            const Icon(
              Icons.check_circle,
              size: 100,
              color: AppColors.yellowcolor,
            ),
            SizedBox(height: 20.h),
            Text(
              'Please verify your email address',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'A verification link has been sent to your email',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  onTap: () {
                    FirebaseAuth.instance.currentUser!.sendEmailVerification();
                  },
                  text: 'Resend Email',
                  color: AppColors.yellowcolor,
                  width: 150.h,
                ),
                CustomButton(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.loginView);
                  },
                  text: 'Go to Login',
                  color: AppColors.yellowcolor,
                  width: 150.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
