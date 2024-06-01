import 'package:flutter/services.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/data/models/comment_model.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/comment_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/comment_state.dart';
import 'package:wide_clean/features/auth/presentation/widgets/comment_input.dart';
import 'package:wide_clean/responsive_appbar.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentBloc(),
      child: _CommentViewContent(),
    );
  }
}

class _CommentViewContent extends StatefulWidget {
  @override
  _CommentViewContentState createState() => _CommentViewContentState();
}

class _CommentViewContentState extends State<_CommentViewContent> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ResponsiveAppBar(title: 'Comments'),
      body: Column(
        children: [
          Expanded(child: _buildCommentList()),
          CommentInput(controller: _commentController),
        ],
      ),
    );
  }

  Widget _buildCommentList() {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        final comments = state.comments;
        final rowCount =
            (comments.length / 2).ceil(); // Calculate the number of rows

        return ListView.builder(
          itemCount: rowCount,
          itemBuilder: (context, index) {
            final firstIndex = index * 2;
            final secondIndex = firstIndex + 1;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildCommentTile(comments[firstIndex]),
                ),
                if (secondIndex < comments.length) SizedBox(width: 8),
                Expanded(
                  child: _buildCommentTile(comments[secondIndex]),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildCommentTile(Comment comment) {
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(comment.personImage),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.userName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 40),
          Text(
            comment.timestamp,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      subtitle: Text(
        comment.userComment,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
