import 'package:cinezone_app/core/theme/app_colors.dart' show AppColors;
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:cinezone_app/core/utils/app_router.dart';
import 'package:cinezone_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FifthView extends StatelessWidget {
  const FifthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            body: SizedBox.expand(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/onboard5.png',
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: 550.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.grey, Colors.transparent],
                        stops: [0.0, .6],
                      ),
                    ),
                  ),
                  Positioned(
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
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          spacing: 15.h,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 5.h),
                            Text(
                              'Start Watching Now',
                              style: Styles.textStyle22,
                            ),
                            CustomButton(
                              textcolor: Colors.black,
                              onTap: () {
                                GoRouter.of(
                                  context,
                                ).pushReplacement(AppRouter.loginView);
                              },
                              text: 'Finish',
                              color: AppColors.yellowcolor,
                              width: double.infinity,
                            ),
                            CustomButton(
                              textcolor: AppColors.yellowcolor,
                              onTap: () {
                                GoRouter.of(context).go(AppRouter.fourthScreen);
                              },
                              text: 'Back',
                              color: Colors.black,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
