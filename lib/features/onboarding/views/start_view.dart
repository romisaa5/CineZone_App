import 'package:cinezone_app/core/theme/app_colors.dart';
import 'package:cinezone_app/core/theme/text_styles.dart';
import 'package:cinezone_app/core/utils/app_router.dart';
import 'package:cinezone_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/movies_posters_group .png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent],
                  stops: [0.0, 0.9],
                ),
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 5.h,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Find Your Next Favorite Movie Here',
                      textAlign: TextAlign.center,
                      style: Styles.textStyle32,
                    ),
                    Text(
                      'Get access to a huge library of movies to suit all tastes. You will surely like it.',
                      textAlign: TextAlign.center,
                      style: Styles.textStyle16,
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      textcolor: Colors.black,
                      onTap: () {
                        GoRouter.of(context).go(AppRouter.firstScreen);
                      },
                      text: 'Explore Now',
                      color: AppColors.yellowcolor,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
