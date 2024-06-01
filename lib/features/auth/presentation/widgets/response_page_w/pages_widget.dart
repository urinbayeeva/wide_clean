import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/pages/home/home_page.dart';
import 'package:wide_clean/features/auth/presentation/pages/profile_page/profile_page.dart';

final GlobalKey<NavigatorState> addPost = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> searchPage = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> profilePage = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> homePage = GlobalKey<NavigatorState>();

class PagesWidget extends StatelessWidget {
  final int selectedIndex;

  const PagesWidget({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const Placeholder();
      case 1:
        return ProfilePage(key: profilePage);
      case 2:
        return Placeholder(key: searchPage);
      case 3:
        return HomePage(key: homePage);
      default:
        return Container();
    }
  }
}
