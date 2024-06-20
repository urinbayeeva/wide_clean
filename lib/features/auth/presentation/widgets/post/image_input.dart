import 'dart:io';
import 'package:wide_clean/core/constants/pages/all_pages.dart';

class ImageInput extends StatelessWidget {
  final String photoOrVideoPath;
  

  const ImageInput({super.key, required this.photoOrVideoPath});

  @override
  Widget build(BuildContext context) {
    TextEditingController descController = TextEditingController();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              SizeConfig.responsiveWidth(1),
            ),
            child: Image.file(
              File(photoOrVideoPath),
              width: 288,
              height: 162,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 162,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(
                SizeConfig.responsiveWidth(1),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.responsiveWidth(1)),
              child: TextFormField(
                controller: descController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Izoh yozing",
                  hintStyle: AppTextStyle.postTextField,
                  fillColor: AppColors.grey,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
