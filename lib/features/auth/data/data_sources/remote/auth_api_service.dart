import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wide_clean/core/constants/api/api_constants.dart';
import 'package:wide_clean/features/auth/data/models/auth/registration_model.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: wideAPIBaseURL)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String? baseUrl}) = _AuthApiService;

  @POST(apiPostRegistration)
  Future<HttpResponse<List<RegistrationModel>>> postUserData(
    @Body() RegistrationModel registrationModel,
  );

  @GET(apiPostRegistration)
  Future<HttpResponse<bool>> checkUserByPhone(
    @Query("phoneNumber") String phoneNumber,
  );

  @GET(checkUser)
  Future<HttpResponse<String>> sendSmsCode(
    @Query("phoneNumber") String phoneNumber,
  );
}
