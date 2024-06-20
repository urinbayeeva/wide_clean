import 'package:flutter/material.dart';
import 'package:wide_clean/core/constants/colors/app_colors.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/config/theme/light_app_textstyle.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/search_textfield_widget.dart';

// ignore: must_be_immutable
class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;
  final List<Widget> actions;
  final bool? isSearch;
  final CallBackFunction? onTap;

  const ResponsiveAppBar(
      {Key? key,
      required this.title,
      this.actions = const [],
      required this.isSearch,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      centerTitle: true,
      title: isSearch!
          ? SearchTextField()
          : (title is String
              ? Text(title, style: AppTextStyle.appBarTextStyle)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:
                            SvgPicture.asset('assets/images/return_back.svg'),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Text("Joylash", style: AppTextStyle.cameraPost),
                      ),
                    ])),
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
