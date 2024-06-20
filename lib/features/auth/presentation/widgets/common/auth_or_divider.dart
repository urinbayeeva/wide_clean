import 'package:wide_clean/core/constants/pages/all_pages.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Expanded(
          child: Container(
        height: 0.2,
        color: AppColors.textFieldColor,
      )),
      Text("\t\t\tyoki\t\t\t",
          style: TextStyle(
              color: AppColors.greyText,
              fontSize: 14,
              fontWeight: FontWeight.w400)),
      Expanded(child: Container(height: 0.2, color: AppColors.textFieldColor))
    ]);
  }
}
