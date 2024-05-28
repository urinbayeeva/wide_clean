import 'package:flutter/material.dart';
import 'package:wide_clean/core/constants/colors/app_colors.dart';
import 'package:wide_clean/core/constants/size/size_config.dart';
import 'package:wide_clean/core/constants/text_style/app_textstyle.dart';

typedef CallBackFunction = void Function();

class ButtonResponse extends StatelessWidget {
  final String? text;
  final CallBackFunction onPressed;
  final Color? color;

  const ButtonResponse(
      {super.key, required this.text, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight * 0.060,
        decoration: BoxDecoration(
          color: color ?? AppColors.mainColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text ?? "",
            style: AppTextStyle.loginTextStyle,
          ),
        ),
      ),
    );
  }
}
