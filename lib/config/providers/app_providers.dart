import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/data/data_sources/remote/auth_api_service.dart';
import 'package:wide_clean/features/auth/data/repository/registration_repostitory_impl.dart';
import 'package:wide_clean/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:dio/dio.dart';

final dio = Dio()
  ..interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
  ));

final authApiService = AuthApiService(dio);
final registrationRepository = RegistrationRepositoryImpl(authApiService);

class AppProviders {
  static List<BlocProvider> get providers => [
        BlocProvider<LanguageBloc>(create: (context) => LanguageBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
        BlocProvider<CommentBloc>(create: (context) => CommentBloc()),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<SettingNavBloc>(create: (context) => SettingNavBloc()),
        BlocProvider<RegistrationBloc>(
            create: (context) => RegistrationBloc(registrationRepository)),
      ];
}
