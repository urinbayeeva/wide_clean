import 'package:wide_clean/core/constants/pages/all_pages.dart';

class IconWidget extends StatelessWidget {
  final String asset;
  final double paddingHeight;
  final VoidCallback onTap;
  final String? count;

  const IconWidget({
    super.key,
    required this.asset,
    required this.paddingHeight,
    required this.onTap,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: SizeConfig.responsiveHeight(paddingHeight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: SvgPicture.asset(asset),
          ),
          if (count != null) Text(count!, style: AppTextStyle.commentedData),
        ],
      ),
    );
  }
}
