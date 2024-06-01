import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/video_bloc/video_event.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController videoController;

  const VideoPlayerWidget({super.key, required this.videoController});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        context.read<VideoBloc>().add(ToggleLikeEvent());
      },
      onTap: () {
        context.read<VideoBloc>().add(PlayPauseEvent());
      },
      child: SizedBox(
        height: videoController.value.size.height,
        width: videoController.value.size.width,
        child: VideoPlayer(videoController),
      ),
    );
  }
}
