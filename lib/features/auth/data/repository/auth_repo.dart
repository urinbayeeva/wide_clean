import 'package:wide_clean/features/auth/data/data_sources/remote/auth_api_service.dart';

class AuthRepository {
  final AuthApiService apiService;

  AuthRepository(this.apiService);

  Future<bool> checkUserByPhone(String phoneNumber) async {
    try {
      final response = await apiService.checkUserByPhone(phoneNumber);
      return response.data ?? false;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> sendSmsCode(String phone) async {
    try {
      final response = await apiService.sendSmsCode(phone);
      return response.data ?? '';
    } catch (e) {
      rethrow;
    }
  }
}
