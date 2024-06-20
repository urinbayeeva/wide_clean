import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/data/data_sources/remote/auth_api_service.dart';
import 'package:wide_clean/features/auth/data/repository/auth_repo.dart';
import 'package:wide_clean/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:wide_clean/features/auth/presentation/pages/sign_up/sign_up.dart';
import 'package:dio/dio.dart';

// Initialize Dio and AuthApiService outside of the providers list
final dio = Dio();
final authApiService = AuthApiService(dio);
final authRepository = AuthRepository(authApiService);

class AppProviders {
  static List<BlocProvider> get providers => [
        BlocProvider<LanguageBloc>(create: (context) => LanguageBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
        BlocProvider<CommentBloc>(create: (context) => CommentBloc()),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<SettingNavBloc>(create: (context) => SettingNavBloc()),
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(authRepository),
        ),
      ];
}
