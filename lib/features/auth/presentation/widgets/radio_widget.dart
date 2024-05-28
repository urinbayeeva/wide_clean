// radio_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/core/constants/colors/app_colors.dart';
import 'package:wide_clean/features/auth/data/models/language_model.dart';
import 'package:wide_clean/features/auth/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/language_bloc/language_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/language_bloc/language_state.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < Language.values.length; i++)
          Column(
            children: [
              RadioCard(language: Language.values[i]),
              SizedBox(height: i == Language.values.length - 1 ? 0 : 8),
            ],
          ),
      ],
    );
  }
}

class RadioCard extends StatelessWidget {
  final Language language;

  const RadioCard({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        final isSelected =
            state is LanguageSelected && state.selectedLanguage == language;
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: AppColors.cardColor,
          child: InkWell(
            onTap: () {
              if (state is LanguageSelected &&
                  state.selectedLanguage != language) {
                context.read<LanguageBloc>().add(LanguageChanged(language));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color:
                        isSelected ? AppColors.mainColor : Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 48,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Radio<Language>(
                      fillColor: WidgetStateProperty.all(AppColors.mainColor),
                      value: language,
                      groupValue: state is LanguageSelected
                          ? state.selectedLanguage
                          : null,
                      onChanged: (Language? value) {
                        if (value != null) {
                          context
                              .read<LanguageBloc>()
                              .add(LanguageChanged(value));
                        }
                      },
                    ),
                    Text(language.displayName),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
