import 'package:cinezone_app/core/utils/app_router.dart';
import 'package:cinezone_app/features/onboarding/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThirdView extends StatelessWidget {
  const ThirdView({super.key});

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
                    'assets/images/onboard3.png',
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
                        colors: [Colors.red, Colors.transparent],
                        stops: [0.0, 1],
                      ),
                    ),
                  ),
                  CustomContainer(
                    isback: true,
                    onTapnext: () {
                      GoRouter.of(context).go(AppRouter.fourthScreen);
                    },
                    onTapback: () {
                      GoRouter.of(context).go(AppRouter.secondScreen);
                    },
                    title: 'Create Watchlists',
                    subtitle:
                        'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
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
