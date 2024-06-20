import 'package:equatable/equatable.dart';
import 'package:wide_clean/features/auth/data/models/home/comment_model.dart';

class CommentState extends Equatable {
  final List<Comment> comments;

  const CommentState({required this.comments});

  @override
  List<Object> get props => [comments];
}
