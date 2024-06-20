import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/category_enum.dart';

class RecPage extends StatefulWidget {
  const RecPage({super.key});

  @override
  State<RecPage> createState() => _RecPageState();
}

class _RecPageState extends State<RecPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final categories = Categories.values.take(8).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  (context, index) => Image.asset(
                        "assets/images/home/cover.png",
                      ),
                  childCount: 100),
            ),
          );
        }).toList(),
      ),
    );
  }
}
