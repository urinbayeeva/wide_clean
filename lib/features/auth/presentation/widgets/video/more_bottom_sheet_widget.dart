import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/pages/home/home_page.dart';

void moreBottomSheet(BuildContext context) {
  double getResponsiveWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth <= 600 ? screenWidth : 800;
  }

  showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: true,
    constraints: BoxConstraints(
      maxWidth: getResponsiveWidth(context),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
      return _buildBottomSheetContent(context);
    },
  );
}

Widget _buildBottomSheetContent(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.4,
    width: MediaQuery.of(context).size.width * 0.8,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildRow(context),
          const SizedBox(height: 24),
          _buildTextButton("Qiziqarli", () {}),
        ],
      ),
    ),
  );
}

Widget _buildRow(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(AppImages.spamIcon),
      TextButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        ),
        child: const Text(
          "Shikoyat",
          style: AppTextStyle.spamTextStyle,
        ),
      ),
    ],
  );
}

Widget _buildTextButton(String text, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: AppTextStyle.spamTextStyle,
    ),
  );
}
