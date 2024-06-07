import 'package:flutter/material.dart';
import 'package:wide_clean/core/constants/colors/app_colors.dart';
import 'package:wide_clean/core/constants/text/app_textstyle.dart';
import 'package:wide_clean/features/auth/presentation/widgets/search_textfield_widget.dart';

// ignore: must_be_immutable
class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool? isSearch;

  const ResponsiveAppBar(
      {super.key,
      required this.title,
      this.actions = const [],
      required this.isSearch});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      centerTitle: true,
      title: isSearch!
          ? SearchTextField()
          : Text(title, style: AppTextStyle.appBarTextStyle),
      actions: actions,
      automaticallyImplyLeading: true,
      toolbarHeight: isSearch! ? 65 : 56,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.grey,
          height: 1.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
