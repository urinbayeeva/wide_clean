import 'package:wide_clean/core/resources/data_state.dart';
import 'package:wide_clean/features/auth/domain/entities/registration.dart';

abstract class RegistrationRepository {
  Future<DataState<List<RegistrationEntity>>> postUserData();
}
