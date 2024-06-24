import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/profile_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/profile_bloc/profile_state.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification) {
                context
                    .read<ProfileBloc>()
                    .add(ScrollEvent(scrollNotification.metrics.pixels));
              }
              return true;
            },
            child: CustomScrollView(
              slivers: [
                _buildSliverAppBar(),
                _buildTabBar(),
                SliverFillRemaining(
                  child: TabBarView(
                    children: [
                      _buildPhotosList(),
                      _buildWidesList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        bool isScrolled = state is ProfileScrolled ? state.isScrolled : false;
        return SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          pinned: true,
          expandedHeight: 180.0,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final isCollapsed = constraints.maxHeight <=
                  kToolbarHeight + MediaQuery.of(context).padding.top;
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                child: FlexibleSpaceBar(
                  expandedTitleScale: 1,
                  titlePadding: const EdgeInsets.symmetric(horizontal: 24.0),
                  title: isCollapsed
                      ? _buildCollapsedTitle()
                      : _buildExpandedTitle(context),
                  centerTitle: false,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCollapsedTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'user000001',
            style: AppTextStyle.profileUserName,
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _showImageDialog(context);
              },
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('user000001', style: AppTextStyle.profileUserName),
                Text('Unknown User', style: AppTextStyle.profileUserSubtitle),
              ],
            ),
            const Spacer(),
            _buildUserInfo(context),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MenuPage()));
              },
              child: SvgPicture.asset(AppImages.menuIcon),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Expanded(
              child: Text(
                "The only thing we have to fear is fear itself.",
                style: AppTextStyle.profileUserSubtitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfileInfo())),
              child: Container(
                width: SizeConfig.screenWidth * 0.4,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                    child: Text("Edit", style: AppTextStyle.editUserName)),
              ),
            )
          ],
        ),
      ],
    );
  }

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Image.asset("assets/images/home/avatar.png")),
        );
      },
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Posts  ", style: AppTextStyle.profileUserInfoFollowers),
          Text("0  ", style: AppTextStyle.userFollowerNumbers),
          Text("Followers  ", style: AppTextStyle.profileUserInfoFollowers),
          Text("0  ", style: AppTextStyle.userFollowerNumbers),
          Text("Following  ", style: AppTextStyle.profileUserInfoFollowers),
          Text("0  ", style: AppTextStyle.userFollowerNumbers),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        const TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 0.01,
          indicatorColor: AppColors.mainColor,
          dividerColor: Colors.transparent,
          labelColor: AppColors.mainColor,
          unselectedLabelColor: AppColors.mainBlackColor,
          tabs: [
            Tab(text: "Photos"),
            Tab(text: "Wides"),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotosList() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 50,
      itemBuilder: (context, index) {
        return const Center(
          child: Text("No Photo"),
        );
      },
    );
  }

  Widget _buildWidesList() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 50,
      itemBuilder: (context, index) {
        return const Placeholder();
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
