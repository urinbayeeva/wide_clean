import 'package:wide_clean/features/auth/presentation/pages/main_page.dart';
import 'package:wide_clean/features/auth/presentation/widgets/post/category_selection.dart';
import 'package:wide_clean/features/auth/presentation/widgets/post/content_type_selection.dart';
import 'package:wide_clean/features/auth/presentation/widgets/post/image_input.dart';

import 'package:wide_clean/features/auth/presentation/widgets/common/responsive_appbar.dart';
import '../../../../../core/constants/pages/all_pages.dart';

List<CameraDescription> cameras = [];

class PostPostView extends StatelessWidget {
  final String photoOrVideoPath;

  const PostPostView({super.key, required this.photoOrVideoPath});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: ResponsiveAppBar(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainPage(selectedPageIndex: 3)));
        },
        title: Row(
          children: const [],
        ),
        isSearch: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.responsiveWidth(4)),
        child: Column(
          children: [
            ImageInput(photoOrVideoPath: photoOrVideoPath),
            const SizedBox(height: 11),
            ContentTypeSelection(),
            const SizedBox(height: 11),
            CategorySelection(),
          ],
        ),
      ),
    );
  }
}
