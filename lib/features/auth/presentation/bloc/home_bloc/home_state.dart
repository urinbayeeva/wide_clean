import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<VideoPlayerController> videoControllers;
  final String username;
  final String personImage;
  final String textOfPost;
  final bool isFollowed;

  const HomeLoaded({
    required this.videoControllers,
    required this.username,
    required this.personImage,
    required this.textOfPost,
    required this.isFollowed,
  });

  @override
  List<Object> get props =>
      [videoControllers, username, personImage, textOfPost, isFollowed];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
