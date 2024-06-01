import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final bool isPlaying;
  final bool isFollowed;
  final Duration position;
  final Duration duration;

  const VideoLoaded({
    required this.isPlaying,
    required this.isFollowed,
    required this.position,
    required this.duration,
  });

  VideoLoaded copyWith({
    bool? isPlaying,
    bool? isFollowed,
    Duration? position,
    Duration? duration,
  }) {
    return VideoLoaded(
      isPlaying: isPlaying ?? this.isPlaying,
      isFollowed: isFollowed ?? this.isFollowed,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }

  @override
  List<Object> get props => [isPlaying, isFollowed, position, duration];
}

class VideoError extends VideoState {}
