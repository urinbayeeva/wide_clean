import 'package:wide_clean/features/auth/data/models/registration_model.dart';

import '../../../../../core/constants/pages/all_pages.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(AppImages.loginLogo),
              SizedBox(height: SizeConfig.screenHeight * 0.12),
              SignTextFieldWidget(
                controller: userNameController,
                hintText: "User name yoki ismingizni kiriting",
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.018),
              SignTextFieldWidget(
                isPassword: true,
                controller: passwordController,
                hintText: "Parolingizni",
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.020),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Parolni unutdingizmi?",
                  style: AppTextStyle.forgotPasswordStyle,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Ro'yxatdan o'tish",
                  style: AppTextStyle.textButton,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.025),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  return ButtonResponse(
                    color: userNameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty
                        ? AppColors.mainColor
                        : AppColors.buttonHover,
                    text: "Kirish",
                    onPressed: () {
                      if (userNameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        // BlocProvider.of<SignInBloc>(context).add(
                        //   SignInButtonPressed(
                        //     username: userNameController.text,
                        //     password: passwordController.text,
                        //   ),
                        // );
                        RegisterUser(
                          userName: userNameController.text.trim(),
                          password: passwordController.text.trim(),
                          phone: '',
                          country: '',
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SignInPhoneNumber()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Iltimos ro'yhatni to'ldiring!"),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.025),
            ],
          ),
        ),
      ),
    );
  }
}
