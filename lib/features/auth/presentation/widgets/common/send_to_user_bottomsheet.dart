import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/search_textfield_widget.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/send_sms_bottomsheet.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/user_display_bottomsheet.dart';

void showHorizontalBottomSheet(BuildContext context) {
  double getResponsiveWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth <= 600 ? screenWidth : 800;
  }

  showModalBottomSheet<void>(
    isScrollControlled: true,
    isDismissible: true,
    constraints: BoxConstraints(
      maxWidth: getResponsiveWidth(context),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (BuildContext context) => const HorizontalBottomSheetContent(),
  );
}

class HorizontalBottomSheetContent extends StatefulWidget {
  const HorizontalBottomSheetContent({Key? key}) : super(key: key);

  @override
  State<HorizontalBottomSheetContent> createState() =>
      _HorizontalBottomSheetContentState();
}

class _HorizontalBottomSheetContentState
    extends State<HorizontalBottomSheetContent> {
  bool isButtonVisible = false;

  void handleAvatarTapped(bool isSelected) {
    setState(() {
      isButtonVisible = isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                width: 1,
                color: AppColors.grey,
              )),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SearchTextField(),
                  isButtonVisible
                      ? GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: SizeConfig.screenWidth * 0.1,
                            height: 36,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text("Yuborish",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        )
                      : Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                AppImages.addToStory,
                                scale: 4,
                              ),
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                AppImages.shareToApps,
                                scale: 4,
                              ),
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                AppImages.shareLink,
                                scale: 4,
                              ),
                            ),
                          ],
                        )
                ],
              ),
            ),
          ),
          Expanded(
            child: UserDisplayBottomSheet(
              onAvatarTappedCallback: handleAvatarTapped,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
              width: 1,
              color: AppColors.grey,
            ))),
            child: const Padding(
              padding: EdgeInsets.only(left: 30, right: 20, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.grey,
                  ),
                  SendSmsBottomSheet(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
