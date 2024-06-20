import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/home_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/home_state.dart';
import 'package:wide_clean/features/auth/presentation/widgets/common/right_side_widget.dart';
import 'package:wide_clean/features/auth/presentation/widgets/video/video_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  bool isFollowed = false;
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(LoadVideosEvent());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    if (homeBloc.state is HomeLoaded) {
      final loadedState = homeBloc.state as HomeLoaded;
      for (var controller in loadedState.videoControllers) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              bloc: homeBloc,
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
    );
  }

  Widget _buildVideoPageView(HomeLoaded state) {
    return PageView.builder(
      onPageChanged: (page) {
        final previousIndex = _pageController.page?.toInt();
        if (previousIndex != null) {
          state.videoControllers[previousIndex].pause();
        }
        state.videoControllers[page].play();
      },
      scrollDirection: Axis.vertical,
      controller: _pageController,
      itemCount: state.videoControllers.length,
      itemBuilder: (context, index) {
        return VideoListWidget(
          videoControllers: state.videoControllers,
          index: index,
          isFollowed: state.isFollowed,
        );
      },
    );
  }

  Widget _buildErrorView() {
    return const Center(child: Text('Page not found'));
  }
}
