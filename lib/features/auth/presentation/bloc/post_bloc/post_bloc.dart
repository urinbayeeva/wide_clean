import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/post_bloc/post_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/post_bloc/post_state.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/category_enum.dart';


class PostPostBloc extends Bloc<PostPostEvent, PostPostState> {
  PostPostBloc() : super(const PostPostState()) {
    on<ToggleCategoryEvent>((event, emit) {
      final List<Categories> updatedCategories;
      if (state.selectedCategories.contains(event.category)) {
        updatedCategories = state.selectedCategories
            .where((category) => category != event.category)
            .toList();
      } else {
        updatedCategories = List.from(state.selectedCategories)
          ..add(event.category);
      }
      emit(state.copyWith(selectedCategories: updatedCategories));
    });

    on<ChangeContentTypeEvent>((event, emit) {
      emit(state.copyWith(contentType: event.contentType));
    });
  }
}
