import 'package:wide_clean/core/constants/pages/all_pages.dart';

class GoogleSignButton extends StatelessWidget {
  const GoogleSignButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.060,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: AppColors.textFieldColor)),
      child: Center(
        child: ListTile(
          leading: SvgPicture.asset(AppImages.googleIcon),
          title: Text(
            "Google akkaunt orqali ro'yhatdan o'tish",
            style: AppTextStyle.googleSignIn,
          ),
        ),
      ),
    );
  }
}
