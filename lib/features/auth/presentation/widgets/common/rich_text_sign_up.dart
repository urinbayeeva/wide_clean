import 'package:flutter/gestures.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
              color: AppColors.mainBlackColor,
              fontSize: 16,
              fontFamily: "Geometria",
              fontWeight: FontWeight.w500),
          children: [
            const TextSpan(text: "Agar ro'yhatdan o’tgan bo'lsangiz "),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pushNamed(context, '/login'),
              text: "kirish\n",
              style: const TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const TextSpan(text: "tugmasini bosing."),
          ],
        ),
      ),
    );
  }
}
