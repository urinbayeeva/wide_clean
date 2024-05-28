import 'package:flutter/material.dart';
import 'package:wide_clean/core/constants/colors/app_colors.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/core/constants/text_style/app_textstyle.dart';
import 'package:wide_clean/features/auth/data/models/registration_model.dart';
import 'package:wide_clean/features/auth/presentation/pages/sign_in/sign_in_sms_code.dart';
import 'package:wide_clean/features/auth/presentation/widgets/button_response.dart';
import 'package:wide_clean/features/auth/presentation/widgets/phone_number_widget.dart';

class SignInPhoneNumber extends StatelessWidget {
  const SignInPhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneCodeNumberController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              "Raqamingizni kiriting va sizga sms/xabar yuboriladi",
              style: AppTextStyle.sendUserSms,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.12),
            PhoneNumberTextFields(
              numberController: phoneNumberController,
              codeController: phoneCodeNumberController,
              hintText: "90 000 00 00",
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.020),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text(
                  "Parolni qayta kiritish",
                  style: AppTextStyle.forgotPasswordStyle,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              child: const Text(
                "Ro'yxatdan o'tish",
                style: AppTextStyle.textButton,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.025),
            ButtonResponse(
              color: phoneCodeNumberController.text.isNotEmpty &&
                      phoneNumberController.text.isNotEmpty
                  ? AppColors.mainColor
                  : AppColors.buttonHover,
              text: "Kirish",
              onPressed: () {
                String phoneNumber = phoneNumberController.text.trim();
                String lastFourDigits =
                    phoneNumber.substring(phoneNumber.length - 4);
                phoneNumberController.text.isNotEmpty &&
                        phoneCodeNumberController.text.isNotEmpty
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInSmsCode(
                            phoneNumber: lastFourDigits,
                          ),
                        ),
                      )
                    : ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Iltimos telefon raqamingizni yozing!"),
                        ),
                      );
                RegistrationModel(phone: phoneNumberController.text.trim());
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.025)
          ],
        ),
      ),
    );
  }
}
