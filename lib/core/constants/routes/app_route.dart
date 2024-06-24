import 'package:wide_clean/core/constants/routes/route_names.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';

class AppRoutes {
  AppRoutes();

  static Route onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.responsePage : 
      {
        return MaterialPageRoute(
              builder: (context) => const MainPage(selectedPageIndex: 3,), settings: settings);
      }
         case RouteNames.splashPage : 
      {
        return MaterialPageRoute(
              builder: (context) => const SplashPage(), settings: settings);
      }
         case RouteNames.homePage : 
      {
        return MaterialPageRoute(
              builder: (context) => const HomePage(), settings: settings);
      }
         case RouteNames.langPage : 
      {
        return MaterialPageRoute(
              builder: (context) => const LanguagePage(), settings: settings);
      }
             case RouteNames.menuPage : 
      {
        return MaterialPageRoute(
              builder: (context) => const MenuPage(), settings: settings);
      }
             case RouteNames.editProfileInfo : 
      {
        return MaterialPageRoute(
              builder: (context) => const EditProfileInfo(), settings: settings);
      }

       case RouteNames.mainPage : 
      {
        return MaterialPageRoute(
              builder: (context) => const MainPage(selectedPageIndex: 3,), settings: settings);
      }
      
      default:
        {
          return _errorRoute();
        }
    
    }
  }
    static Route _errorRoute() => MaterialPageRoute(builder: (context) {
        return const Scaffold(
          body: Center(child: Text("Error page routing")),
        );
      });

}
