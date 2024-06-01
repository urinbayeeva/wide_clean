import 'package:wide_clean/features/auth/data/models/comment_model.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/comment_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/comment_event.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';

class CommentInput extends StatelessWidget {
  final TextEditingController controller;
  const CommentInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: AppColors.grey)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage("assets/images/ava_1.png"),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Leave your comment',
                    hintStyle: AppTextStyle.textFieldHintStyle),
              ),
            ),
            IconButton(
              onPressed: () {
                final commentText = controller.text;
                if (commentText.isNotEmpty) {
                  final newComment = Comment(
                    userName: "New User",
                    userComment: commentText,
                    personImage: "assets/images/default_avatar.png",
                    timestamp: "just now",
                  );
                  context.read<CommentBloc>().add(AddComment(newComment));
                  controller.clear();
                }
              },
              icon: Image.asset(AppImages.send),
            ),
          ],
        ),
      ),
    );
  }
}
