import 'package:wide_clean/core/constants/pages/all_pages.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: AppProviders.providers,
    child: MyApp(),
  ));
}
