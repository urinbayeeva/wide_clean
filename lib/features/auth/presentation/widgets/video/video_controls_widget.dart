import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:wide_clean/core/constants/colors/app_colors.dart';
import 'package:wide_clean/features/auth/presentation/bloc/video_bloc/video_bloc.dart';
import 'package:wide_clean/features/auth/presentation/bloc/video_bloc/video_event.dart';

class VideoControlsWidget extends StatefulWidget {
  final VideoPlayerController videoController;

  const VideoControlsWidget({
    super.key,
    required this.videoController,
  });

  @override
  // ignore: library_private_types_in_public_api
  _VideoControlsWidgetState createState() => _VideoControlsWidgetState();
}

class _VideoControlsWidgetState extends State<VideoControlsWidget> {
  late ValueNotifier<Duration> _positionNotifier;
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _positionNotifier =
        ValueNotifier<Duration>(widget.videoController.value.position);
    widget.videoController.addListener(_updatePosition);
  }

  @override
  void dispose() {
    widget.videoController.removeListener(_updatePosition);
    _positionNotifier.dispose();
    super.dispose();
  }

  void _updatePosition() {
    if (!_isScrolling) {
      _positionNotifier.value = widget.videoController.value.position;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollStartNotification) {
          setState(() {
            _isScrolling = true;
          });
        } else if (notification is ScrollEndNotification) {
          setState(() {
            _isScrolling = false;
            _updatePosition();
          });
        }
        return true;
      },
      child: Positioned.fill(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: ValueListenableBuilder<Duration>(
                valueListenable: _positionNotifier,
                builder: (context, position, child) {
                  return SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 1.0,
                      thumbShape: SliderComponentShape.noThumb,
                      overlayShape: SliderComponentShape.noThumb,
                      activeTrackColor: AppColors.mainColor,
                      inactiveTrackColor: Colors.white,
                      trackShape: const RoundedRectSliderTrackShape(),
                    ),
                    child: Slider(
                      value: position.inSeconds.toDouble(),
                      min: 0.0,
                      max: widget.videoController.value.duration.inSeconds
                          .toDouble(),
                      onChanged: (newPosition) {
                        _positionNotifier.value =
                            Duration(seconds: newPosition.toInt());
                      },
                      onChangeEnd: (newPosition) {
                        widget.videoController
                            .seekTo(Duration(seconds: newPosition.toInt()));
                        context.read<VideoBloc>().add(
                              UpdatePositionEvent(
                                  Duration(seconds: newPosition.toInt())),
                            );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
