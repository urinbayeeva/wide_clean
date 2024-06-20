import 'package:wide_clean/core/constants/pages/all_pages.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController codeNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(AppImages.loginLogo),
            SizedBox(height: SizeConfig.screenHeight * 0.10),
            RichTextWidget(),
            SizedBox(height: SizeConfig.screenHeight * 0.10),
            SignTextFieldWidget(
              controller: userNameController,
              hintText: "Ismingiz",
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.018),
            PhoneNumberTextFields(
              codeController: codeNameController,
              numberController: numberController,
              hintText: "90 000 00 00 ",
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.040),
            DividerWidget(),
            SizedBox(height: SizeConfig.screenHeight * 0.040),
            GoogleSignButton(),
            const Spacer(),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSmsSent) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SignUpCode(phoneNumber: numberController.text),
                    ),
                  );
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                return ButtonResponse(
                  color: userNameController.text.isNotEmpty &&
                          codeNameController.text.isNotEmpty &&
                          numberController.text.isNotEmpty
                      ? AppColors.mainColor
                      : AppColors.buttonHover,
                  text: "Keyingisi",
                  onPressed: () {
                    print("${numberController.text}");
                    if (numberController.text.isNotEmpty) {
                      context.read<AuthBloc>().add(
                            SendSmsCodeEvent(
                                '${codeNameController.text}${numberController.text}'),
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Iltimos telefon raqamingizni kiriting!"),
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
    );
  }
}
