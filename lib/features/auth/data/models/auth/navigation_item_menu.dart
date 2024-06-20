import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/menu_nav_event.dart';

class NavigationItem {
  final SvgPicture icon;
  final Text title;
  final NavigationEvent event;

  NavigationItem(
      {required this.icon, required this.title, required this.event});
}

final List<NavigationItem> navigationItems = [
  NavigationItem(
      icon: SvgPicture.asset(AppImages.personIcon, width: 24, height: 24),
      title: Text(
        "Profile",
        style: AppTextStyle.menuCategory,
      ),
      event: NavigateToPage1()),
  NavigationItem(
      icon: SvgPicture.asset(AppImages.saveIcon),
      title: Text(
        "Saved",
        style: AppTextStyle.menuCategory,
      ),
      event: NavigateToPage2()),
  NavigationItem(
      icon: SvgPicture.asset(AppImages.settingIcon),
      title: Text(
        "Settings",
        style: AppTextStyle.menuCategory,
      ),
      event: NavigateToPage3()),
  NavigationItem(
      icon: SvgPicture.asset(AppImages.staticIcon),
      title: Text(
        "Statistic",
        style: AppTextStyle.menuCategory,
      ),
      event: NavigateToPage4()),
];
