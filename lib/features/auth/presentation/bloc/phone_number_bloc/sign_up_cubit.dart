import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:wide_clean/features/auth/presentation/pages/sign_in/sign_in_sms_code.dart';
import 'package:wide_clean/features/auth/data/models/auth/registration_model.dart';
import 'phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit() : super(PhoneNumberInitial());

  void phoneNumberChanged(String phoneNumber, String phoneCode) {
    if (phoneNumber.isNotEmpty && phoneCode.isNotEmpty) {
      emit(PhoneNumberValid());
    } else {
      emit(PhoneNumberInvalid());
    }
  }

  void submitPhoneNumber(
      BuildContext context, String phoneNumber, String phoneCode) {
    if (phoneNumber.isNotEmpty && phoneCode.isNotEmpty) {
      String lastFourDigits = phoneNumber.substring(phoneNumber.length - 4);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignInSmsCode(
            phoneNumber: lastFourDigits,
          ),
        ),
      );
      RegistrationModel(phone: phoneNumber.trim());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Iltimos telefon raqamingizni yozing!"),
        ),
      );
    }
  }
}
