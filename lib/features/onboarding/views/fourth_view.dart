import 'package:cinezone_app/core/utils/app_router.dart';
import 'package:cinezone_app/features/onboarding/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FourthView extends StatelessWidget {
  const FourthView({super.key});

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
                    'assets/images/onboard4.png',
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
                        colors: [Colors.orange, Colors.transparent],
                        stops: [0.0, 1.4],
                      ),
                    ),
                  ),
                  CustomContainer(
                    onTapnext: () {
                      GoRouter.of(context).go(AppRouter.fifthScreen);
                    },
                    onTapback: () {
                      GoRouter.of(context).go(AppRouter.thirdScreen);
                    },
                    title: 'Rate, Review, and Learn',
                    subtitle:
                        "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
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
