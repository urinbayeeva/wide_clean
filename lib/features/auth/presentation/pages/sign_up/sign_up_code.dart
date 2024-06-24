import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/pages/sign_up/sign_up_password.dart';
import 'package:pinput/pinput.dart';

class SignUpCode extends StatefulWidget {
  final String phoneNumber;
  const SignUpCode({super.key, required this.phoneNumber});

  @override
  State<SignUpCode> createState() => _SignUpCodeState();
}

class _SignUpCodeState extends State<SignUpCode> {
  TextEditingController smsCodeController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final focusedPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  final submittedPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: Color.fromRGBO(234, 239, 243, 1),
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

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
            Pinput(
              length: 5,
              controller: smsCodeController,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == '22222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SignUpPassword(),
                  //   ),
                  // );
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
