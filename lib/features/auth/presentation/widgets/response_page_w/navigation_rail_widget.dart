import 'package:wide_clean/core/constants/pages/all_pages.dart';

class NavigationRailWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavigationRailWidget({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: NavigationRail(
        backgroundColor: Colors.white,
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        labelType: NavigationRailLabelType.none,
        useIndicator: false,
        leading: selectedIndex == 2
            ? const SizedBox.shrink()
            : Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: selectedIndex == 1
                        ? BorderSide.none
                        : const BorderSide(width: 1, color: AppColors.grey),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  child: SvgPicture.asset(
                    AppImages.navBarLogo,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
        destinations: <NavigationRailDestination>[
          NavigationRailDestination(
            indicatorColor: Colors.transparent,
            icon: Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: SvgPicture.asset(AppImages.addIcon),
            ),
            label: const Text(""),
          ),
          NavigationRailDestination(
            icon: Padding(
              padding: const EdgeInsets.only(left: 20, top: 28),
              child: SvgPicture.asset(AppImages.profilePageIcon),
            ),
            label: const Text(""),
          ),
          NavigationRailDestination(
            icon: Padding(
              padding: const EdgeInsets.only(left: 20, top: 28),
              child: SvgPicture.asset(AppImages.searchPageIcon),
            ),
            label: const Text(""),
          ),
          NavigationRailDestination(
            icon: Padding(
              padding: const EdgeInsets.only(left: 20, top: 28),
              child: SvgPicture.asset(AppImages.homePageIcon),
            ),
            label: const Text(""),
          ),
        ],
      ),
    );
  }
}
