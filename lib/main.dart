import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';


void main() {
   final dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
  ));

  runApp(MultiBlocProvider(
    providers: AppProviders.providers,
    child: MyApp(),
  ));
}
