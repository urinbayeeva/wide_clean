// language_event.dart
import 'package:equatable/equatable.dart';
import 'package:wide_clean/features/auth/data/models/language_model.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object?> get props => [];
}

class LanguageChanged extends LanguageEvent {
  final Language selectedLanguage;

  const LanguageChanged(this.selectedLanguage);

  @override
  List<Object?> get props => [selectedLanguage];
}
