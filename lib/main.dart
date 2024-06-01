import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:wide_clean/features/auth/presentation/pages/response_page.dart';
import 'package:wide_clean/features/auth/presentation/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(create: (context) => LanguageBloc()),
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
          "/responsePage": (context) => const ResponsePage(selectedPageIndex: 3)
        },
        initialRoute: "/responsePage",
      ),
    );
  }
}
