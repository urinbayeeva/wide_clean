import 'package:bloc/bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/profile_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ScrollEvent) {
      yield ProfileScrolled(event.scrollOffset > 0);
    }
  }
}
