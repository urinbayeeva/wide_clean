import 'package:wide_clean/core/constants/pages/all_pages.dart';

class SignInPhoneNumber extends StatelessWidget {
  const SignInPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhoneNumberCubit(),
      child: SignInPhoneNumberForm(),
    );
  }
}

class SignInPhoneNumberForm extends StatefulWidget {
  const SignInPhoneNumberForm({super.key});

  @override
  _SignInPhoneNumberFormState createState() => _SignInPhoneNumberFormState();
}

class _SignInPhoneNumberFormState extends State<SignInPhoneNumberForm> {
  final TextEditingController phoneCodeNumberController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneCodeNumberController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              onChanged: (phoneCode, phoneNumber) {
                context
                    .read<PhoneNumberCubit>()
                    .phoneNumberChanged(phoneNumber, phoneCode);
              },
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
            BlocBuilder<PhoneNumberCubit, PhoneNumberState>(
              builder: (context, state) {
                bool isButtonEnabled = state is PhoneNumberValid;
                return ButtonResponse(
                  color: isButtonEnabled
                      ? AppColors.mainColor
                      : AppColors.buttonHover,
                  text: "Kirish",
                  onPressed: isButtonEnabled
                      ? () =>
                          context.read<PhoneNumberCubit>().submitPhoneNumber(
                                context,
                                phoneNumberController.text.trim(),
                                phoneCodeNumberController.text.trim(),
                              )
                      : () {}, // Provide a default empty function
                );
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.025),
          ],
        ),
      ),
    );
  }
}
