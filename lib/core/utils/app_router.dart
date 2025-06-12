import 'package:cinezone_app/features/auth/login/views/forget_password.dart';
import 'package:cinezone_app/features/auth/login/views/login_view.dart';
import 'package:cinezone_app/features/auth/register/presentation/views/email_verified_view.dart';
import 'package:cinezone_app/features/auth/register/presentation/views/register_view.dart';
import 'package:cinezone_app/features/home/models/movie.dart';
import 'package:cinezone_app/features/home/presentation/views/details_view.dart';
import 'package:cinezone_app/features/navBar/presentation/views/nav_bar.dart';
import 'package:cinezone_app/features/onboarding/views/fifth_view.dart';
import 'package:cinezone_app/features/onboarding/views/first_view.dart';
import 'package:cinezone_app/features/onboarding/views/fourth_view.dart';
import 'package:cinezone_app/features/onboarding/views/second_view.dart';
import 'package:cinezone_app/features/onboarding/views/start_view.dart';
import 'package:cinezone_app/features/onboarding/views/third_view.dart';
import 'package:cinezone_app/features/profile/presentation/views/edit_profile_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final welcomeView = '/welcomeview';
  static final firstScreen = '/onboardingscreen1';
  static final secondScreen = '/onboardingscreen2';
  static final thirdScreen = '/onboardingscreen3';
  static final fourthScreen = '/onboardingscreen4';
  static final fifthScreen = '/onboardingscreen5';
  static final loginView = '/loginview';
  static final registerView = '/registerview';
  static final emailVerifiedView = '/emailverifiedview';
  static final forgetPassword = '/forgetpassword';
  static final homeview = '/homeview';
  static final detailsview = '/detailsview';
  static final editprofileview = '/editprofileview';
  static final router = GoRouter(
    initialLocation: homeview,

    routes: [
      GoRoute(path: welcomeView, builder: (context, state) => StartView()),
      GoRoute(path: firstScreen, builder: (context, state) => FirstView()),
      GoRoute(path: secondScreen, builder: (context, state) => SecondView()),
      GoRoute(path: thirdScreen, builder: (context, state) => ThirdView()),
      GoRoute(path: fourthScreen, builder: (context, state) => FourthView()),
      GoRoute(path: fifthScreen, builder: (context, state) => FifthView()),
      GoRoute(path: loginView, builder: (context, state) => LoginView()),
      GoRoute(path: registerView, builder: (context, state) => RegisterView()),
      GoRoute(path: homeview, builder: (context, state) => NavBarView()),
      GoRoute(
        path: detailsview,
        builder: (context, state) {
          final movie = state.extra as Movie;
          return DetailsView(movie: movie);
        },
      ),
      GoRoute(
        path: emailVerifiedView,
        builder: (context, state) => EmailVerifiedView(),
      ),
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => ForgetPassword(),
      ),
      GoRoute(
        path: editprofileview,
        builder: (context, state) => EditProfileView(),
      ),
    ],
  );
}
