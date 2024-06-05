import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/comment_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/menu_nav_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:wide_clean/features/auth/presentation/pages/profile_page/menu/menu_page.dart';
import 'package:wide_clean/features/auth/presentation/pages/response_page.dart';
import 'package:wide_clean/features/auth/presentation/pages/home/home_page.dart';
import 'package:wide_clean/features/auth/presentation/pages/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<VideoPlayerController> _videoControllers;

  @override
  void initState() {
    super.initState();
    _videoControllers = [
      VideoPlayerController.networkUrl(Uri.parse(
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')),
      VideoPlayerController.networkUrl(Uri.parse(
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4')),
    ];

    for (var controller in _videoControllers) {
      controller.initialize();
    }
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(create: (context) => LanguageBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
        BlocProvider<CommentBloc>(create: (context) => CommentBloc()),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<VideoBloc>(
            create: (context) => VideoBloc(_videoControllers[0])),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeData(
          fontFamily: "Geometria",
          checkboxTheme: Theme.of(context).checkboxTheme.copyWith(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Wide',
        routes: {
          "/splashPage": (context) => const SplashPage(),
          "/homePage": (context) => const HomePage(),
          "/responsePage": (context) =>
              const ResponsePage(selectedPageIndex: 3),
          "/menuPage": (context) => MenuPage(),
        },
        initialRoute: "/responsePage",
      ),
    );
  }
}
