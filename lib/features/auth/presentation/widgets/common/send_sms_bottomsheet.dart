import 'package:wide_clean/core/constants/pages/all_pages.dart';

class SendSmsBottomSheet extends StatelessWidget {
  const SendSmsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double responsiveWidth = SizeConfig.responsiveWidth(65.7);
    double responsiveHeight = SizeConfig.responsiveHeight(8.6);
    double responsivePaddingHorizontal = SizeConfig.responsiveWidth(1.0);
    double responsivePaddingVertical = SizeConfig.responsiveHeight(0.8);

    return SizedBox(
      width: responsiveWidth,
      height: responsiveHeight,
      child: TextField(
        decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEFEFEF), // var(--grey-grey-3, #EFEFEF)
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEFEFEF), // var(--grey-grey-3, #EFEFEF)
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFEFEFEF), // var(--grey-grey-3, #EFEFEF)
              ),
            ),
            hintText: "Type your message here",
            hintStyle: AppTextStyle.searchText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: responsivePaddingHorizontal,
              vertical: responsivePaddingVertical,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.textFieldColor,
              ),
            ),
            filled: true,
            fillColor: const Color(0xFFF7F7F7)),
      ),
    );
  }
}
