import 'package:wide_clean/core/constants/pages/all_pages.dart';

typedef CallBackFunction = void Function();

class RightSide extends StatelessWidget {
  final List<String> iconPath;
  final List<String>? counts;
  final CallBackFunction onPressed;

  const RightSide({
    super.key,
    required this.iconPath,
    this.counts,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(left: BorderSide(width: 1, color: AppColors.grey))),
      width: 80,
      child: ListView.builder(
        itemCount: iconPath.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  InkWell(
                    child: Center(
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: AppColors.grey))),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            AppImages.messageFillIcon,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          final adjustedIndex = index - 1;

          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: onPressed,
                    child: SvgPicture.asset(iconPath[adjustedIndex],
                        width: 26, height: 26)),
                if (counts != null && counts!.length > adjustedIndex)
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(counts![adjustedIndex],
                        style: AppTextStyle.rightNavBarStyle),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
