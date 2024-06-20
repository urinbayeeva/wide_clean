import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/config/theme/light_app_textstyle.dart';
import 'package:wide_clean/config/theme/size_config.dart';
import 'package:wide_clean/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/button_response.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/radio_widget.dart';
import 'package:wide_clean/features/auth/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/language_bloc/language_state.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.20),
            const Center(
              child: Text(
                "O'zingiz yaxshi biladigan\ntilni tanlang",
                textAlign: TextAlign.center,
                style: AppTextStyle.chooseLanguagePage,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.15),
            const RadioWidget(),
            const Spacer(),
            BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
                if (state is LanguageSelected &&
                    state.selectedLanguage != null) {
                  return ButtonResponse(
                    text: "Kirish",
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage())),
                  );
                } else {
                  return const SizedBox.shrink();
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
