import 'package:equatable/equatable.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/category_enum.dart';

class PostPostState extends Equatable {
  final List<Categories> selectedCategories;
  final String contentType;

  const PostPostState({
    this.selectedCategories = const [],
    this.contentType = "Bepul",
  });

  PostPostState copyWith({
    List<Categories>? selectedCategories,
    String? contentType,
  }) {
    return PostPostState(
      selectedCategories: selectedCategories ?? this.selectedCategories,
      contentType: contentType ?? this.contentType,
    );
  }

  @override
  List<Object> get props => [selectedCategories, contentType];
}
