import 'package:flutter/gestures.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';

class SignInSmsCode extends StatelessWidget {
  final String phoneNumber;
  const SignInSmsCode({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    TextEditingController smsCodeController = TextEditingController();
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
                text: "$phoneNumber code yuborildi coden\n kiriting ",
                style: AppTextStyle.sendUserSms,
                children: [
                  TextSpan(
                    text: "Raqamni qayta kiritish",
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
                hintText: "sms kod"),
            SizedBox(height: SizeConfig.screenHeight * 0.020),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text(
                  "Kod kelmadimi?",
                  style: AppTextStyle.forgotPasswordStyle,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
                child: const Text("Ro'yxatdan o'tish",
                    style: AppTextStyle.textButton)),
            SizedBox(height: SizeConfig.screenHeight * 0.025),
            ButtonResponse(
              color: smsCodeController.text.isNotEmpty
                  ? AppColors.mainColor
                  : AppColors.buttonHover,
              text: "Kirish",
              onPressed: () => smsCodeController.text.isNotEmpty
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SignInSmsCode(phoneNumber: phoneNumber),
                      ),
                    )
                  : ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Iltimos telefon raqamingizni yozing!"),
                      ),
                    ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.025)
          ],
        ),
      ),
    );
  }
}
