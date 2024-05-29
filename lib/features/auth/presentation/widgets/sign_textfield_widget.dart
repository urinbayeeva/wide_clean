import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import Flutter SVG package
import 'package:wide_clean/core/constants/size/size_config.dart';
import 'package:wide_clean/core/constants/text_style/app_textstyle.dart';
import 'package:wide_clean/core/constants/colors/app_colors.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart'; // Make sure you import AppImages

class SignTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool isCode;

  const SignTextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isPassword = false,
      this.validator,
      this.onChanged,
      this.isCode = false});

  @override
  // ignore: library_private_types_in_public_api
  _SignTextFieldWidgetState createState() => _SignTextFieldWidgetState();
}

class _SignTextFieldWidgetState extends State<SignTextFieldWidget> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: 52,
      child: TextFormField(
        keyboardType:
            widget.isCode! ? TextInputType.number : TextInputType.text,
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTextStyle.textFieldHintStyle,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.textFieldColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.textFieldColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.mainColor,
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.textFieldError,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.textFieldError,
              width: 1.0,
            ),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: SvgPicture.asset(
                    _obscureText ? AppImages.eyeOffIcon : AppImages.eyeOnIcon,
                  ),
                  onPressed: _toggleVisibility,
                )
              : widget.controller.text.isNotEmpty
                  ? IconButton(
                      icon: SvgPicture.asset(
                        AppImages.textfFieldClear,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.controller.clear();
                        });
                      },
                    )
                  : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
