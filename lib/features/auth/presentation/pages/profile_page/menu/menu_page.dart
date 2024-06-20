import 'package:provider/provider.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/data/models/auth/navigation_item_menu.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/menu_nav_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/menu_nav_event.dart';
import 'package:wide_clean/features/auth/presentation/pages/profile_page/menu/menu_profile.dart';
import 'package:wide_clean/features/auth/presentation/pages/profile_page/menu/menu_saved.dart';
import 'package:wide_clean/features/auth/presentation/pages/profile_page/menu/menu_settings.dart';
import 'package:wide_clean/features/auth/presentation/pages/profile_page/menu/menu_statistic.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/responsive_appbar.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  void _navigateTo(BuildContext context, NavigationEvent event) {
    final bloc = context.read<NavigationBloc>();
    bloc.add(event);
    if (event is NavigateToPage1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => MenuProfile()));
    } else if (event is NavigateToPage2) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => MenuSaved()));
    } else if (event is NavigateToPage3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => MenuSettings()));
    } else if (event is NavigateToPage4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => MenuStatistic()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ResponsiveAppBar(
        title: "Menu",
        isSearch: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: ListView.builder(
          itemCount: navigationItems.length,
          itemBuilder: (context, index) {
            final item = navigationItems[index];
            return Column(
              children: [
                ListTile(
                  leading: item.icon,
                  title: item.title,
                  trailing: SvgPicture.asset(AppImages.enterIcon),
                  onTap: () => _navigateTo(context, item.event),
                ),
                if (index < navigationItems.length - 1)
                  Divider(
                    color: AppColors.grey,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
