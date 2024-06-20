import 'package:bloc/bloc.dart';
import 'package:video_player/video_player.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadVideosEvent>(_onLoadVideos);
    on<ToggleFollowEvent>(_onToggleFollow);
  }

  void _onLoadVideos(LoadVideosEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    List<VideoPlayerController> videoControllers = [
      VideoPlayerController.networkUrl(Uri.parse(
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4')),
      VideoPlayerController.networkUrl(Uri.parse(
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')),
      VideoPlayerController.networkUrl(Uri.parse(
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4')),
    ];

    for (var controller in videoControllers) {
      await controller.initialize();
      controller.setLooping(true);
    }

    videoControllers.first.play();

    emit(HomeLoaded(
      videoControllers: videoControllers,
      username: 'Sample User',
      personImage: 'https://example.com/person_image.jpg',
      textOfPost: 'Sample post text',
      isFollowed: false,
    ));
  }

  void _onToggleFollow(ToggleFollowEvent event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(HomeLoaded(
        videoControllers: currentState.videoControllers,
        username: currentState.username,
        personImage: currentState.personImage,
        textOfPost: currentState.textOfPost,
        isFollowed: !currentState.isFollowed,
      ));
    }
  }
}
