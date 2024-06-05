import 'package:bloc/bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/menu_nav_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/menu_nav_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(Page1State()) {
    on<NavigateToPage1>((event, emit) => emit(Page1State()));
    on<NavigateToPage2>((event, emit) => emit(Page2State()));
    on<NavigateToPage3>((event, emit) => emit(Page3State()));
    on<NavigateToPage4>((event, emit) => emit(Page4State()));
    on<NavigateToPage5>((event, emit) => emit(Page5State()));
  }
}
