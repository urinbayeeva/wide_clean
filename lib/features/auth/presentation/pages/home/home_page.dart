import 'package:flutter/services.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/home_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/home_state.dart';
import 'package:wide_clean/features/auth/presentation/widgets/right_side_widget.dart';

import 'package:wide_clean/features/auth/presentation/widgets/video/video_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  bool isFollowed = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadVideosEvent()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ));
                  } else if (state is HomeLoaded) {
                    return _buildVideoPageView(state);
                  } else {
                    return _buildErrorView();
                  }
                },
              ),
            ),
            const RightSideWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPageView(HomeLoaded state) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemCount: state.videoControllers.length,
      itemBuilder: (context, index) {
        return VideoListWidget(
          videoControllers: state.videoControllers,
          index: index,
          isFollowed: isFollowed,
        );
      },
    );
  }

  Widget _buildErrorView() {
    return const Center(child: Text('Page not found'));
  }
}
