import 'package:equatable/equatable.dart';
import 'package:wide_clean/features/auth/data/models/comment_model.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class AddComment extends CommentEvent {
  final Comment comment;

  const AddComment(this.comment);

  @override
  List<Object> get props => [comment];
}
