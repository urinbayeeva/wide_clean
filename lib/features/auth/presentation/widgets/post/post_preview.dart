import 'dart:io';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/pages/add_post/post_post.dart';

class PostPreview extends StatelessWidget {
  final String photoOrVideoPath;

  const PostPreview({super.key, required this.photoOrVideoPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/images/return_back.svg'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostPost(photoOrVideoPath: photoOrVideoPath)));
              },
              child: Text("Joylash", style: AppTextStyle.cameraPost),
            ),
          ],
        ),
      ),
      body: Center(
        child: Image.file(
          File(photoOrVideoPath),
        ),
      ),
    );
  }
}
