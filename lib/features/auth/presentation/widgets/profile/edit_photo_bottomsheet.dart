import 'package:camera/camera.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/widgets/post/gallery_preview.dart';
import 'package:wide_clean/features/auth/presentation/widgets/post/post_post_view.dart';
import 'package:wide_clean/features/auth/presentation/widgets/profile/take_a_photo.dart';
import 'package:wide_clean/features/auth/presentation/widgets/profile/edit_photo_gallery.dart';
import 'package:wide_clean/main.dart';

void editPhotoBottomSheet(BuildContext context) async {
  cameras = await availableCameras();
  double getResponsiveWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth <= 600 ? screenWidth : 1000;
  }

  showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: true,
    constraints: BoxConstraints(
      maxWidth: getResponsiveWidth(context),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) {
      return _buildBottomSheetContent(context);
    },
  );
}

Widget _buildBottomSheetContent(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.5,
    child: _buildRow(context),
  );
}

Widget _buildRow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            child: SvgPicture.asset(AppImages.deleteTextField),
          ),
        ),
        _buildIconTextButtonRow(
            context: context,
            text: "Choose from photos ",
            onPressed: () {
              editGallery(context);
            }),
        const SizedBox(height: 16),
        _buildIconTextButtonRow(
            context: context,
            text: "Take a photo              ",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TakeAPhoto(cameras: cameras)));
            }),
        const SizedBox(height: 16),
        _buildIconTextButtonRow(
            context: context, text: "Delete current photo", onPressed: () {}),
      ],
    ),
  );
}

Widget _buildIconTextButtonRow(
    {required BuildContext context,
    required String text,
    required void Function() onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Card(
      elevation: 0,
      color: Colors.transparent,
      child: Text(
        text,
        style: AppTextStyle.spamTextStyle,
      ),
    ),
  );
}
