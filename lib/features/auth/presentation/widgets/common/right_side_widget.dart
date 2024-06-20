import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/pages/home/comments_page.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/right_side_icon.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/send_to_user_bottomsheet.dart';

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.responsiveWidth(10),
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(width: 1, color: AppColors.grey)),
      ),
      child: Column(
        children: [
          InkWell(
            child: Center(
              child: Container(
                height: SizeConfig.responsiveHeight(20),
                width: SizeConfig.screenWidth,
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: AppColors.grey)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.responsiveHeight(5)),
                  child: SvgPicture.asset(AppImages.messageFillIcon),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.responsiveHeight(12)),
          IconWidget(
            asset: AppImages.likeFillIcon,
            paddingHeight: 9,
            onTap: () {},
            count: "10",
          ),
          IconWidget(
            asset: AppImages.commentIcon,
            paddingHeight: 9,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CommentView()),
              );
            },
          ),
          IconWidget(
            asset: AppImages.sendIcon,
            paddingHeight: 9,
            onTap: () {
              showHorizontalBottomSheet(context);
            },
          ),
          IconWidget(
            asset: AppImages.saveIcon,
            paddingHeight: 0,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
