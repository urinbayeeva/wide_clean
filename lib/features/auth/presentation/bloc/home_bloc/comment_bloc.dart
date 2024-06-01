import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/data/models/comment_model.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/comment_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc()
      : super(CommentState(
          comments: [
            Comment(
              userName: "Abdulla",
              userComment:
                  "At vero eos et accusamus et iusto odio dignissimos ducimus ",
              personImage: "assets/images/ava_1.png",
              timestamp: "1 hour",
            ),
            Comment(
              userName: "Doston",
              userComment: "At vero eos et accusamus et ?",
              personImage: "assets/images/ava_2.png",
              timestamp: "1 hour",
            ),
            Comment(
              userName: "Sardor",
              userComment:
                  "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint o",
              personImage: "assets/images/ava_3.png",
              timestamp: "1 hour",
            ),
            Comment(
              userName: "Abdulla",
              userComment:
                  "At vero eos et accusamus et iusto odio dignissimos ducimus ",
              personImage: "assets/images/ava_4.png",
              timestamp: "1 hour",
            ),
            Comment(
              userName: "Wide",
              userComment:
                  "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint o",
              personImage: "assets/images/ava_5.png",
              timestamp: "1 hour",
            ),
            Comment(
              userName: "Liiil",
              userComment: "At vero eos et accusamus et ?",
              personImage: "assets/images/ava_6.png",
              timestamp: "1 hour",
            ),
          ],
        )) {
    on<AddComment>((event, emit) {
      final updatedComments = List<Comment>.from(state.comments)
        ..add(event.comment);
      emit(CommentState(comments: updatedComments));
    });
  }
}
