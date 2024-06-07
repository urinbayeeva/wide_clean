import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/menu_nav_event.dart';

class SettingNavBloc extends Bloc<NavigationEvent, void> {
  SettingNavBloc() : super(null);

  @override
  Stream<void> mapEventToState(NavigationEvent event) async* {
    // Handle navigation events
    if (event is NavigateToPage1) {
      // Navigate to Profile
    } else if (event is NavigateToPage2) {
      // Navigate to Saved
    } else if (event is NavigateToPage3) {
      // Navigate to Settings
    } else if (event is NavigateToPage4) {
      // Navigate to Statistic
    } else if (event is NavigateToPage5) {
      // Navigate to About
    } else if (event is NavigateToPage6) {
      // Perform Logout
    }
  }
}
