import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wide_clean/core/constants/colors/app_colors.dart';
import 'package:wide_clean/features/auth/data/models/navigation_item_settings.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/menu_nav_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/setting_nav_bloc.dart';
import 'package:wide_clean/features/auth/presentation/pages/profile_page/settings/lang_page.dart';
import 'package:wide_clean/features/auth/presentation/pages/profile_page/settings/user_info.dart';
import 'package:wide_clean/responsive_appbar.dart';

class MenuSettings extends StatelessWidget {
  const MenuSettings({super.key});

  void navigate(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LanguagePage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserInfo()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserInfo()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserInfo()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserInfo()),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserInfo()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ResponsiveAppBar(
        title: "Settings",
        isSearch: false,
      ),
      body: ListView.builder(
        itemCount: navItemSettings.length,
        itemBuilder: (context, index) {
          final item = navItemSettings[index];
          return Column(
            children: [
              ListTile(
                leading: item.icon,
                title: item.title,
                onTap: () {
                  navigate(context, index);
                },
              ),
              if (index < navItemSettings.length - 1)
                Divider(
                  color: AppColors.grey,
                ),
            ],
          );
        },
      ),
    );
  }
}
