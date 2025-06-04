import 'package:cinezone_app/core/utils/app_router.dart';
import 'package:cinezone_app/features/onboarding/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key});

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
                    'assets/images/onboard2.png',
                    height: 550.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.red, Colors.transparent],
                        stops: [0.0, 1],
                      ),
                    ),
                  ),
                  CustomContainer(
                    onTapnext: () {
                      GoRouter.of(context).go(AppRouter.thirdScreen);
                    },
                    onTapback: () {
                      GoRouter.of(context).go(AppRouter.firstScreen);
                    },
                    title: 'Explore All Genres',
                    subtitle:
                        'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
                    isback: true,
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
