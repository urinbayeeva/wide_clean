import 'package:flutter/gestures.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';

class PasswordTextRich extends StatelessWidget {
  const PasswordTextRich({super.key});

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
            const TextSpan(
                text:
                    "Parolda 8 ta harf, kamida bitta belg\n va bitta son ishtirok etgan bo'lishi kerak"),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pushNamed(context, '/login'),
              text: " foydalanish bo'limini kiritish",
              style: const TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
