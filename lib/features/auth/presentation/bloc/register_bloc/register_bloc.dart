import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/core/resources/data_state.dart';
import 'package:wide_clean/features/auth/domain/repository/registration_repository.dart';
import 'package:wide_clean/features/auth/presentation/bloc/register_bloc/register_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/register_bloc/register_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepository _registrationRepository;

  RegistrationBloc(this._registrationRepository)
      : super(RegistrationInitial()) {
    on<CheckUserExists>(_onCheckUserExists);
    on<SendSmsCode>(_onSendSmsCode);
    on<VerifySmsCode>(_onVerifySmsCode);
    on<RegisterUser>(_onRegisterUser);
  }

  void _onCheckUserExists(
      CheckUserExists event, Emitter<RegistrationState> emit) async {
    final response =
        await _registrationRepository.checkUserExists(event.phoneNumber);
    if (response is DataSuccess == true) {
      emit(UserDoesNotExist());
    } else if (response is DataSuccess == false) {
      emit(UserExists());
    } else {
      emit(RegistrationFailure("Failed to check user existence"));
    }
  }

  void _onSendSmsCode(
      SendSmsCode event, Emitter<RegistrationState> emit) async {
    final response =
        await _registrationRepository.sendSmsCode(event.phoneNumber);
    if (response is DataSuccess) {
      emit(SmsCodeSent());
    } else {
      emit(RegistrationFailure("Failed to send SMS code"));
    }
  }

  void _onVerifySmsCode(
      VerifySmsCode event, Emitter<RegistrationState> emit) async {
    final bool isSmsCodeValid =
        await _verifySmsCode(event.phoneNumber, event.smsCode);
    if (isSmsCodeValid) {
      emit(SmsCodeVerified());
    } else {
      emit(RegistrationFailure("Invalid SMS code"));
    }
  }

 void _onRegisterUser(
      RegisterUser event, Emitter<RegistrationState> emit) async {
    final response = await _registrationRepository.postUserData(
  
    );
    if (response is DataSuccess) {
      emit(RegistrationSuccess());
    } else {
      emit(RegistrationFailure("Failed to register user"));
    }
  }

  Future<bool> _verifySmsCode(String phoneNumber, String smsCode) async {
    return true;
  }
}
