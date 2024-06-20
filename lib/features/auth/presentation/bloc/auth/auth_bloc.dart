import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wide_clean/features/auth/data/repository/auth_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<CheckUserByPhoneEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final userExists = await authRepository.checkUserByPhone(event.phoneNumber);
        emit(AuthLoaded(userExists));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<SendSmsCodeEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final smsCode = await authRepository.sendSmsCode(event.phoneNumber);
        emit(AuthSmsSent(smsCode));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
