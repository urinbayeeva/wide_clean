import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/features/auth/data/data_sources/remote/auth_api_service.dart';
import 'package:wide_clean/features/auth/data/models/auth/registration_model.dart';
import 'package:wide_clean/features/auth/presentation/bloc/sign_up_bloc/sign_up_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/sign_up_bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthApiService authApiService;

  SignUpBloc(this.authApiService) : super(SignUpInitial());

  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield SignUpLoading();

      try {
        final response = await authApiService.postUserData(RegistrationModel(
          userName: event.userName,
          phone: event.phoneNumber,
        ));

        if (response.response.statusCode == HttpStatus.ok) {
          yield SignUpSuccess();
        } else {
          yield SignUpFailure(error: 'Failed to sign up');
        }
      } catch (e) {
        yield SignUpFailure(error: 'An error occurred');
      }
    }
  }
}
