import 'package:bloc/bloc.dart';
import 'package:video_player/video_player.dart';
import 'video_event.dart';
import 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoPlayerController videoController;

  VideoBloc(this.videoController) : super(VideoInitial()) {
    on<LoadVideoEvent>(_onLoadVideo);
    on<PlayPauseEvent>(_onPlayPause);
    on<ToggleFollowEvent>(_onToggleFollow);
    on<UpdatePositionEvent>(_onUpdatePosition);
    on<ToggleLikeEvent>(_onToggleLike);
  }

  void _onLoadVideo(LoadVideoEvent event, Emitter<VideoState> emit) async {
    emit(VideoLoading());
    try {
      // await videoController.initialize();
      emit(VideoLoaded(
        isPlaying: false,
        isFollowed: false,
        position: videoController.value.position,
        duration: videoController.value.duration,
      ));
    } catch (error) {
      emit(VideoError());
    }
  }

  void _onPlayPause(PlayPauseEvent event, Emitter<VideoState> emit) {
    final isPlaying = videoController.value.isPlaying;
    if (isPlaying) {
      videoController.pause();
    } else {
      videoController.play();
    }
    emit((state as VideoLoaded).copyWith(isPlaying: !isPlaying));
  }

  void _onToggleFollow(ToggleFollowEvent event, Emitter<VideoState> emit) {
    final isFollowed = (state as VideoLoaded).isFollowed;
    emit((state as VideoLoaded).copyWith(isFollowed: !isFollowed));
  }

  void _onUpdatePosition(UpdatePositionEvent event, Emitter<VideoState> emit) {
    videoController.seekTo(event.newPosition);
    emit((state as VideoLoaded).copyWith(position: event.newPosition));
  }

  void _onToggleLike(ToggleLikeEvent event, Emitter<VideoState> emit) {
    // Handle like toggling logic here
  }

}
