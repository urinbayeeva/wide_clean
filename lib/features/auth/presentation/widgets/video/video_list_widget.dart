import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wide_clean/core/constants/text_style/app_textstyle.dart';
import 'video_widget.dart';

class VideoListWidget extends StatelessWidget {
  final List<VideoPlayerController> videoControllers;
  final int index;
  final bool isFollowed;

  const VideoListWidget({
    super.key,
    required this.videoControllers,
    required this.index,
    required this.isFollowed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoWidget(
          videoController: videoControllers[index],
        ),
        Visibility(
          visible: isFollowed,
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Wide ga hush kelibsiz", style: AppTextStyle.welcomeWide),
                Text(
                  "Do'stlarga obuna bo'ling va vaqtingizni unumli o'tkazing",
                  style: AppTextStyle.welcomeSubtitle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
