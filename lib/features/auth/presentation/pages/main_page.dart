  
import 'package:flutter/services.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/category_enum.dart';
import 'package:wide_clean/features/auth/presentation/widgets/response_page_w/navigation_rail_widget.dart';
import 'package:wide_clean/features/auth/presentation/widgets/response_page_w/pages_widget.dart';

class MainPage extends StatefulWidget {
  final int selectedPageIndex;

  const MainPage({super.key, required this.selectedPageIndex});

  @override  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 3;
  final categories = Categories.values.take(8).toList();

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedPageIndex;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: selectedIndex == 2 ? _buildAppBar() : null,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selectedIndex != 0
                ? NavigationRailWidget(
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: PagesWidget(selectedIndex: selectedIndex),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20.0),
        child: TabBar(
          labelStyle: AppTextStyle.category,
          splashFactory: NoSplash.splashFactory,
          dividerHeight: 0,
          isScrollable: true,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.grey,
            border: Border.all(width: 1, color: AppColors.mainColor),
          ),
          tabs: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Tab(
                text: category.toString().split('.').last,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
