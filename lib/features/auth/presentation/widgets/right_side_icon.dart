import 'package:wide_clean/core/constants/pages/all_pages.dart';

class IconWidget extends StatelessWidget {
  final String asset;
  final double paddingHeight;
  final VoidCallback onTap;

  const IconWidget({
    super.key,
    required this.asset,
    required this.paddingHeight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: SizeConfig.responsiveHeight(paddingHeight)),
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(asset),
      ),
    );
  }
}
