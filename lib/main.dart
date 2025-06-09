import 'package:cinezone_app/core/utils/app_router.dart';
import 'package:cinezone_app/features/home/presentation/manager/cubit/movie_cubit.dart';
import 'package:cinezone_app/features/navBar/manager/cubit/nav_bar_cubit.dart';
import 'package:cinezone_app/features/profile/presentation/manager/cubit/watch_history_cubit.dart';
import 'package:cinezone_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const CineZoneApp());
}

class CineZoneApp extends StatefulWidget {
  const CineZoneApp({super.key});

  @override
  State<CineZoneApp> createState() => _CineZoneAppState();
}

class _CineZoneAppState extends State<CineZoneApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('===========================User is currently signed out!');
      } else {
        print('===========================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavBarCubit()),
        BlocProvider(create: (_) => MovieCubit()),
        BlocProvider(create: (_) => WatchHistoryCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            theme: ThemeData.dark(),
          );
        },
      ),
    );
  }
}
