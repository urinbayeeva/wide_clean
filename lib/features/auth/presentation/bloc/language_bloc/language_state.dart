// language_state.dart
import 'package:equatable/equatable.dart';
import 'package:wide_clean/features/auth/data/models/auth/language_model.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object?> get props => [];
}

class LanguageInitial extends LanguageState {}

class LanguageSelected extends LanguageState {
  final Language selectedLanguage;

  const LanguageSelected(this.selectedLanguage);

  @override
  List<Object?> get props => [selectedLanguage];
}
