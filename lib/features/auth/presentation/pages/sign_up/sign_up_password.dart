import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/bloc/register_bloc/register_bloc.dart' as register;
import 'package:wide_clean/features/auth/presentation/bloc/register_bloc/register_event.dart' as register;

import 'package:wide_clean/features/auth/presentation/bloc/register_bloc/register_state.dart' as register;
import 'package:wide_clean/features/auth/presentation/widgets/common/password_richtext.dart';



class SignUpPassword extends StatefulWidget {
  final String name;
  final String phoneNumber;
  const SignUpPassword({super.key, required this.name, required this.phoneNumber});

  @override
  State<SignUpPassword> createState() => _SignUpPasswordState();
}

class _SignUpPasswordState extends State<SignUpPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    confirmPassword.dispose();
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
            SizedBox(height: SizeConfig.screenHeight * 0.090),
            Text(
              "Foydalanish uchun parol kiriting",
              style: AppTextStyle.registrationTextBigger,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.040),
            PasswordTextRich(),
            const Spacer(),
            SignTextFieldWidget(
                controller: passwordController,
                hintText: "Parolingiz",
                isPassword: true),
            SizedBox(height: SizeConfig.screenHeight * 0.018),
            SignTextFieldWidget(
                controller: confirmPassword,
                hintText: "Parolingizni tasdiqlang",
                isPassword: true),
            const Spacer(),
            const Text("Kirish", style: AppTextStyle.loginRegistrationStyle),
            SizedBox(height: SizeConfig.screenHeight * 0.040),
           BlocConsumer<register.RegistrationBloc, register.RegistrationState>(
              listener: (context, state) {},
              builder: (context, state) {
                return ButtonResponse(
                  color: passwordController.text.isNotEmpty &&
                          confirmPassword.text.isNotEmpty 
                      ? AppColors.mainColor
                      : AppColors.buttonHover,
                  text: "Keyingisi",
                  onPressed: () {
                    if (passwordController.text.isNotEmpty &&
                       confirmPassword.text.isNotEmpty ) {
                     
                    }
                   
                  },
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
