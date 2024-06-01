import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/home_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/home_bloc/home_state.dart';
import 'video_info_widget.dart';

class VideoInfoScreen extends StatelessWidget {
  const VideoInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: VideoInfoWidget(
                userName: '',
                personImage: '',
                textOfPost: '',
                isFollowed: false,
                onFollowPressed: () {},
                isLoading: true,
              ),
            );
          } else if (state is HomeLoaded) {
            return Center(
              child: VideoInfoWidget(
                userName: state.username,
                personImage: state.personImage,
                textOfPost: state.textOfPost,
                isFollowed: state.isFollowed,
                onFollowPressed: () {
                  context.read<HomeBloc>().add(ToggleFollowEvent());
                },
                isLoading: false,
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
