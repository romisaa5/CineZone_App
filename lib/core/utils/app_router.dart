import 'package:cinezone_app/features/onboarding/views/first_view.dart';
import 'package:cinezone_app/features/onboarding/views/second_view.dart';
import 'package:cinezone_app/features/onboarding/views/start_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final welcomeView = '/welcomeview';
  static final firstScreen = '/onboardingscreen1';
  static final secondScreen = '/onboardingscreen2';
  static final thirdScreen = '/onboardingscreen3';
  static final fourthScreen = '/onboardingscreen4';
  static final fiveScreen = '/onboardingscreen5';
  static final loginView = '/loginview';
  static final registerView = '/registerview';
  static final emailVerifiedView = '/emailverifiedview';
  static final router = GoRouter(
    initialLocation: welcomeView,
    routes: [
      GoRoute(path: welcomeView, builder: (context, state) => StartView()),
      GoRoute(path: firstScreen, builder: (context, state) => FirstView()),
      GoRoute(path: secondScreen, builder: (context, state) => SecondView()),
    ],
  );
}
