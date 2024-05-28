import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/sign_in_bloc/sign_in_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/sign_in_bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is RegisterUser) {
      try {
        // Simulate registration process, replace with actual logic
        await Future.delayed(Duration(seconds: 2));

        // Registration successful
        yield RegistrationSuccess();
      } catch (error) {
        yield RegistrationFailure(error.toString());
      }
    }
  }
}
