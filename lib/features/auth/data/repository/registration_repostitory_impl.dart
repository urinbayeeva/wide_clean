import 'package:dio/dio.dart';
import 'package:wide_clean/core/resources/data_state.dart';
import 'package:wide_clean/features/auth/data/data_sources/remote/auth_api_service.dart';
import 'package:wide_clean/features/auth/data/models/registration_model.dart';
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
  Future<DataState<List<RegistrationEntity>>> checkUserExists() {
    // TODO: implement checkUserExists
    throw UnimplementedError();
  }

}
