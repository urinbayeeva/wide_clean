import 'package:equatable/equatable.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/category_enum.dart';

abstract class PostPostEvent extends Equatable {
  const PostPostEvent();

  @override
  List<Object> get props => [];
}

class ToggleCategoryEvent extends PostPostEvent {
  final Categories category;

  const ToggleCategoryEvent(this.category);

  @override
  List<Object> get props => [category];
}

class ChangeContentTypeEvent extends PostPostEvent {
  final String contentType;

  const ChangeContentTypeEvent(this.contentType);

  @override
  List<Object> get props => [contentType];
}
