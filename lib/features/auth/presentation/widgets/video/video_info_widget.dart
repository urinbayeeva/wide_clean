import 'package:shimmer/shimmer.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';

class VideoInfoWidget extends StatelessWidget {
  final String userName;
  final String personImage;
  final String textOfPost;
  final bool isFollowed;
  final VoidCallback onFollowPressed;
  final bool isLoading;

  const VideoInfoWidget({
    super.key,
    required this.userName,
    required this.personImage,
    required this.textOfPost,
    required this.isFollowed,
    required this.onFollowPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 100,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 8),
            _buildPostText(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildProfileImage(),
            const SizedBox(width: 8),
            _buildUsername(),
            const SizedBox(width: 34),
            _buildPostDetails(),
          ],
        ),
        _buildFollowButton(),
      ],
    );
  }

  Widget _buildProfileImage() {
    return isLoading
        ? _buildShimmer(
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          )
        : CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(personImage),
            backgroundColor: AppColors.greybb,
          );
  }

  Widget _buildUsername() {
    return isLoading
        ? _buildShimmer(
            child: Container(
              width: 100,
              height: 18,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        : Text(
            userName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
  }

  Widget _buildPostDetails() {
    return isLoading
        ? _buildShimmer(
            child: Container(
              width: 120,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        : Row(
            children: [
              SvgPicture.asset(AppImages.watchersEye),
              const SizedBox(width: 4),
              const Text(
                "400     1 hour ago",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          );
  }

  Widget _buildFollowButton() {
    return isLoading
        ? _buildShimmer(
            child: Container(
              width: 70,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 0.5,
              ),
            ),
            child: InkWell(
              onTap: onFollowPressed,
              child: Container(
                height: 20,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    isFollowed ? 'Following' : 'Follow',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Widget _buildPostText() {
    return isLoading
        ? _buildShimmer(
            child: Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        : GestureDetector(
            onTap: () {},
            child: ExpandableText(
              animation: true,
              expandOnTextTap: true,
              textOfPost,
              expandText: '',
              maxLines: 1,
              collapseOnTextTap: true,
              linkColor: Colors.white,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
  }

  Widget _buildShimmer({required Widget child}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      direction: ShimmerDirection.ttb,
      loop: 5,
      child: child,
    );
  }
}
