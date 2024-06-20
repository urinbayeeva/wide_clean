import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/pages/sign_up/sign_up_password.dart';

class SignUpCode extends StatefulWidget {
  final String phoneNumber;
  const SignUpCode({super.key, required this.phoneNumber});

  @override
  State<SignUpCode> createState() => _SignUpCodeState();
}

class _SignUpCodeState extends State<SignUpCode> {
  TextEditingController smsCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    "${widget.phoneNumber} raqamiga kod yuborildi. Kodni kiriting:",
                style: AppTextStyle.sendUserSms,
                children: [
                  TextSpan(
                    text: " Raqamni qayta kiritish",
                    style: AppTextStyle.forgotPasswordStyle,
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.12),
            SignTextFieldWidget(
              isCode: true,
              controller: smsCodeController,
              hintText: "SMS kod",
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.020),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  "Kod kelmadimi?",
                  style: AppTextStyle.forgotPasswordStyle,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              child: const Text("Ro'yxatdan o'tish",
                  style: AppTextStyle.textButton),
              onTap: () {},
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.025),
            ButtonResponse(
              color: smsCodeController.text.isNotEmpty
                  ? AppColors.mainColor
                  : AppColors.buttonHover,
              text: "Keyingisi",
              onPressed: () {
                if (smsCodeController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPassword(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Iltimos SMS kodni kiriting!"),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.025),
          ],
        ),
      ),
    );
  }
}
