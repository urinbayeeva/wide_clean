import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wide_clean/core/constants/api/api_constants.dart';
import 'package:wide_clean/features/auth/data/models/auth/registration_model.dart';
import 'package:dio/dio.dart' hide Headers;
part 'auth_api_service.g.dart';

@RestApi(baseUrl: wideAPIBaseURL)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String? baseUrl}) = _AuthApiService;

  @POST("Login/Registration")
  Future<HttpResponse<List<RegistrationModel>>> postUserData(
    @Body() RegistrationModel registrationModel,
  );

  @GET(checkUser)
  @Headers(<String, dynamic>{
    'Accept': 'text/plain',
  })
  Future<HttpResponse<List<RegistrationModel>>> checkUserByPhone(
    @Query("phone") String phoneNumber,
  );

  @GET("Login/sendsmscode")
  Future<HttpResponse<String>> sendSmsCode(
    @Query("phone") String phone,
  );
}
