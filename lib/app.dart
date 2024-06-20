import 'package:wide_clean/config/routes/route_names.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/data/repository/auth_repo.dart';

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        themeMode: CustomTheme.themeMode,
        theme: CustomTheme.lightThemeData,
        darkTheme: CustomTheme.darkThemeData,
        debugShowCheckedModeBanner: false,
        title: 'Wide',
        initialRoute: RouteNames.splashPage,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
