import 'dart:io';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:wide_clean/core/constants/pages/all_pages.dart';
import 'package:wide_clean/features/auth/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/video_bloc/video_event.dart';
import 'package:wide_clean/features/auth/presentation/bloc/video_bloc/video_state.dart';
import 'package:wide_clean/features/auth/presentation/widgets/video/more_bottom_sheet_widget.dart';
import 'package:wide_clean/features/auth/presentation/widgets/video/video_info_widget.dart';
import 'package:wide_clean/features/auth/presentation/widgets/video/video_player_widget.dart';

class VideoWidget extends StatefulWidget {
  final VideoPlayerController videoController;
  final String? photoPath;

  const VideoWidget({super.key, required this.videoController, this.photoPath});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VideoBloc(widget.videoController)..add(LoadVideoEvent()),
      child: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          bool isLoading = state is VideoLoading;
          return Stack(
            children: [
              if (isLoading) _buildLoadingShimmer(),
              if (state is VideoLoaded)
                VideoPlayerWidget(videoController: widget.videoController),
              if (widget.photoPath != null) Image.file(File(widget.photoPath!)),
              Positioned(
                top: 18,
                right: 4,
                child: IconButton(
                  onPressed: () {
                    moreBottomSheet(context);
                  },
                  icon: RotatedBox(
                    quarterTurns: 1,
                    child: SvgPicture.asset(AppImages.moreIcon),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 100,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VideoInfoWidget(
                        userName: "qwerty",
                        personImage: "personImage",
                        textOfPost:
                            "I believe that everything happens for a reason. People change so that you can learn to let go, things go wrong so that you appreciate them when they're right, you believe lies so you eventually learn to trust no one but yourself, and sometimes good things fall apart so better things can fall together.”― Marilyn Monroe",
                        isFollowed: state is VideoLoaded && state.isFollowed,
                        onFollowPressed: () {
                          context.read<VideoBloc>().add(ToggleFollowEvent());
                        },
                        isLoading: isLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoadingShimmer() {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade200,
        direction: ShimmerDirection.ttb,
        loop: 5,
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
