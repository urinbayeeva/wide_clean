import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/sign_in_bloc/sign_in_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/sign_in_bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial());

  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is RegisterUser) {
      try {
        await Future.delayed(const Duration(seconds: 0));
        yield RegistrationSuccess();
      } catch (error) {
        yield RegistrationFailure(error.toString());
      }
    }
  }
}
