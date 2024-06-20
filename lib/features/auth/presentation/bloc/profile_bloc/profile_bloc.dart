// profile_bloc.dart
import 'package:bloc/bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ScrollEvent>(_onScrollEvent);
  }

  void _onScrollEvent(ScrollEvent event, Emitter<ProfileState> emit) {
    emit(ProfileScrolled(event.scrollOffset));
  }
}
