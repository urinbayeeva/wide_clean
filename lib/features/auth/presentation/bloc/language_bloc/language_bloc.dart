// language_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/features/auth/data/models/language_model.dart';
import 'package:wide_clean/features/auth/presentation/bloc/language_bloc/language_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/language_bloc/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageChanged>((event, emit) {
      emit(LanguageSelected(event.selectedLanguage));
    });
  }
}
