import 'package:wide_clean/core/constants/routes/route_aware.dart';
import 'package:wide_clean/config/theme/scale_size.dart';
import 'package:wide_clean/features/auth/presentation/pages/sign_in/sign_in_forget.dart';
import 'package:wide_clean/features/auth/presentation/pages/sign_up/sign_up.dart';

import '../../../../../core/constants/pages/all_pages.dart';

class SignInPage extends StatelessWidget {
  final bool showLanguage;
  const SignInPage({super.key, this.showLanguage = false});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    SizeConfig().init(context);

    // return BlocProvider(
    //   create: (context) => SignInBloc(),
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Visibility(
                replacement: const SizedBox.shrink(),
                visible: showLanguage,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(AppImages.langGlobus),
                        const SizedBox(height: 0),
                        Text(
                          " O'zbekiston",
                          style: AppTextStyle.chooseLoginPage,
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SvgPicture.asset(AppImages.loginLogo),
              SizedBox(height: SizeConfig.screenHeight * 0.10),
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
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInForgetPassword())),
                  child: const Text(
                    "Parolni unutdingizmi?",
                    style: AppTextStyle.forgotPasswordStyle,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp())),
                child: const Text(
                  "Ro'yxatdan o'tish",
                  style: AppTextStyle.textButton,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.025),
              ButtonResponse(
                color: userNameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty
                    ? AppColors.mainColor
                    : AppColors.buttonHover,
                text: "Kirish",
                onPressed: () {
                  if (userNameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    // RegisterUser(
                    //   userName: userNameController.text.trim(),
                    //   password: passwordController.text.trim(),
                    //   phone: '',
                    //   country: '',
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => showLanguage
                            ? const RouteAwareWidget(
                                routeName: "/responsePage",
                                child: MainPage(selectedPageIndex: 3),
                              )
                            : const SignInPhoneNumber(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Iltimos ro'yhatni to'ldiring!"),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.025),
            ],
          ),
        ));
  }
}
