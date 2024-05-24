// import 'package:dio/dio.dart';
// import 'package:wide_clean/core/resources/data_state.dart';
// import 'package:wide_clean/features/auth/data/data_sources/remote/auth_api_service.dart';
// import 'package:wide_clean/features/auth/data/models/registration_model.dart';
// import 'package:wide_clean/features/auth/domain/entities/registration.dart';
// import 'package:wide_clean/features/auth/domain/repository/registration_repository.dart';

// class RegistrationRepositoryImpl implements RegistrationRepository {
//   final AuthApiService _authApiService;

//   RegistrationRepositoryImpl(this._authApiService);

//   @override
//   Future<DataState<List<RegistrationEntity>>> postUserData(
//       RegistrationEntity registrationEntity) async {
//     try {
//       // Convert RegistrationEntity to RegistrationModel
//       final registrationModel =
//           RegistrationModel.fromEntity(registrationEntity);

//       // Call the API to post user data
//       final response = await _authApiService.postUserData(registrationModel);

//       // Check the response status
//       if (response.statusCode == 200) {
//         // If successful, return success with the data
//         return DataState.success(response.data);
//       } else {
//         // If not successful, return error with the error message
//         return DataState.error(
//             "Failed to post user data: ${response.statusMessage}");
//       }
//     } catch (e) {
//       // If an exception occurs, return error with the exception message
//       return DataState.error("An error occurred: $e");
//     }
//   }
// }
