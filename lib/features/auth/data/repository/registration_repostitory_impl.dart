import 'package:dio/dio.dart';
import 'package:wide_clean/core/resources/data_state.dart';
import 'package:wide_clean/features/auth/data/data_sources/remote/auth_api_service.dart';
import 'package:wide_clean/features/auth/data/models/auth/registration_model.dart';
import 'package:wide_clean/features/auth/domain/entities/registration.dart';
import 'package:wide_clean/features/auth/domain/repository/registration_repository.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final AuthApiService _authApiService;

  RegistrationRepositoryImpl(this._authApiService);

  @override
  Future<DataState<List<RegistrationEntity>>> postUserData() async {
    try {
      RegistrationEntity registrationEntity = const RegistrationEntity();
      final registrationModel =
          RegistrationModel.fromEntity(registrationEntity);

      final response = await _authApiService.postUserData(registrationModel);
      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
            DioException(requestOptions: response.response.requestOptions));
      }
    } catch (e) {
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<DataState<bool>> checkUserExists(String phoneNumber) async {
    try {
      final response = await _authApiService.checkUserByPhone(phoneNumber);
      print("Response: \n \n ${response.data.result.success} \n\n");
      if (response.data.result.success == true) {
        return DataSuccess(true);
      } else if (response.data.result.success == false) {
        return DataSuccess(false);
      } else {
        return DataFailed(
            DioException(requestOptions: response.response.requestOptions));
      }
    } catch (e) {
      print("Exception: \n \n $e \n\n");
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<DataState<bool>> sendSmsCode(String phoneNumber) async {
    try {
      final response = await _authApiService.sendSmsCode(phoneNumber);
      if (response.response.statusCode == 200) {
        return DataSuccess(response.data.result.success);
      } else {
        return DataFailed(
            DioException(requestOptions: response.response.requestOptions));
      }
    } catch (e) {
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }
}

