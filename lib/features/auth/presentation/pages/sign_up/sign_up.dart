import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/bloc/register_bloc/register_bloc.dart'
    as register;
import 'package:wide_clean/features/auth/presentation/bloc/register_bloc/register_event.dart'
    as register;
import 'package:wide_clean/features/auth/presentation/bloc/register_bloc/register_state.dart'
    as register;
import 'package:wide_clean/features/auth/presentation/pages/sign_up/sign_up_password.dart';

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
      backgroundColor: const Color(0xFFFEFEFE),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(AppImages.loginLogo),
            SizedBox(height: SizeConfig.screenHeight * 0.10),
            const RichTextWidget(),
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
            const DividerWidget(),
            SizedBox(height: SizeConfig.screenHeight * 0.040),
            const GoogleSignButton(),
            const Spacer(),
            BlocConsumer<register.RegistrationBloc, register.RegistrationState>(
              listener: (context, state) {},
              builder: (context, state) {
                return ButtonResponse(
                  color: userNameController.text.isNotEmpty &&
                          codeNameController.text.isNotEmpty &&
                          numberController.text.isNotEmpty
                      ? AppColors.mainColor
                      : AppColors.buttonHover,
                  text: "Keyingisi",
                  onPressed: () {
                    if (codeNameController.text.isNotEmpty && numberController.text.isNotEmpty) {
                      BlocProvider.of<register.RegistrationBloc>(context).add(
                        register.CheckUserExists(
                            "${codeNameController.text}${numberController.text}"),
                      );
                      if (state is register.UserExists) {
                       
                      } else if (state is register.UserDoesNotExist) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Placeholder()));
                      }
                      BlocProvider.of<register.RegistrationBloc>(context).add(
                        register.CheckUserExists(
                            "${codeNameController.text}${numberController.text}"),
                      );

                      // BlocProvider.of<register.RegistrationBloc>(context).add(
                      //     register.SendSmsCode(
                      //         "${codeNameController.text}${numberController.text}"));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SignUpPassword()));
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
