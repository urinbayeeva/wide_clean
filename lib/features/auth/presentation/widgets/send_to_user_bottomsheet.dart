import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/widgets/search_textfield_widget.dart';
import 'package:wide_clean/features/auth/presentation/widgets/send_sms_bottomsheet.dart';
import 'package:wide_clean/features/auth/presentation/widgets/user_display_bottomsheet.dart';

void showHorizontalBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) => const HorizontalBottomSheetContent(),
  );
}

class HorizontalBottomSheetContent extends StatelessWidget {
  const HorizontalBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 2,
      child: Column(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1, color: AppColors.grey)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SearchTextField(),
                  Row(
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

          const Expanded(
            child: UserDisplayBottomSheet(),
          ),

          // ignore: prefer_const_constructors
          Container(
            decoration: const BoxDecoration(
                border:
                    Border(top: BorderSide(width: 1, color: AppColors.grey))),
            child: const Padding(
              padding: EdgeInsets.only(left: 30, right: 20, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.grey,
                  ),
                  SendSmsBottomSheet()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
