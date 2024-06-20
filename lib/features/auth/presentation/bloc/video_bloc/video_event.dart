import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class InitControllersEvent extends VideoEvent {
  final List<String> urls;
  const InitControllersEvent(this.urls);
}
  
class LoadVideoEvent extends VideoEvent {}

class PlayPauseEvent extends VideoEvent {}

class ToggleFollowEvent extends VideoEvent {}

class UpdatePositionEvent extends VideoEvent {
  final Duration newPosition;

  const UpdatePositionEvent(this.newPosition);

  @override
  List<Object> get props => [newPosition];
}

class ToggleLikeEvent extends VideoEvent {}
