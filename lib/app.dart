import 'package:wide_clean/core/constants/routes/route_names.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';

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
        initialRoute: RouteNames.mainPage,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
