import 'package:cinezone_app/core/utils/app_router.dart';
import 'package:cinezone_app/features/onboarding/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

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
                    'assets/images/onboard1.png',
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
                        colors: [
                          Color.fromARGB(255, 118, 198, 213),
                          Colors.transparent,
                        ],
                        stops: [0.0, 1],
                      ),
                    ),
                  ),
                  CustomContainer(
                    title: 'Discover Movies',
                    subtitle:
                        'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
                    isback: false,
                    onTapnext: () {
                      GoRouter.of(context).go(AppRouter.secondScreen);
                    },
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
