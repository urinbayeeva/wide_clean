import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wide_clean/core/constants/images/app_images.dart';
import 'package:wide_clean/core/constants/text/app_textstyle.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/menu_nav_event.dart';

class NavItemSetting {
  final SvgPicture icon;
  final Text title;
  final NavigationEvent event;

  NavItemSetting({
    required this.icon,
    required this.title,
    required this.event,
  });
}

final List<NavItemSetting> navItemSettings = [
  NavItemSetting(
    icon: SvgPicture.asset(AppImages.langGlobus, width: 24, height: 24),
    title: Text(
      "Language",
      style: AppTextStyle.menuCategory,
    ),
    event: NavigateToPage1(),
  ),
  NavItemSetting(
    icon: SvgPicture.asset(AppImages.premiumVersionIcon),
    title: Text(
      "Premium version",
      style: AppTextStyle.menuCategory,
    ),
    event: NavigateToPage2(),
  ),
  NavItemSetting(
    icon: SvgPicture.asset(AppImages.notificationsIcon),
    title: Text(
      "Notifications",
      style: AppTextStyle.menuCategory,
    ),
    event: NavigateToPage3(),
  ),
  NavItemSetting(
    icon: SvgPicture.asset(AppImages.personIcon),
    title: Text(
      "User Info",
      style: AppTextStyle.menuCategory,
    ),
    event: NavigateToPage4(),
  ),
  NavItemSetting(
    icon: SvgPicture.asset(AppImages.userInfoIcon),
    title: Text(
      "Admin",
      style: AppTextStyle.menuCategory,
    ),
    event: NavigateToPage5(),
  ),
  NavItemSetting(
    icon: SvgPicture.asset(AppImages.logOutIcon),
    title: Text(
      "Logout",
      style: AppTextStyle.menuCategory,
    ),
    event: NavigateToPage6(),
  ),
];
