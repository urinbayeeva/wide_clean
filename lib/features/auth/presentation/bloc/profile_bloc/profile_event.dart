abstract class ProfileEvent {}

class ScrollEvent extends ProfileEvent {
  final double scrollOffset;

  ScrollEvent(this.scrollOffset);
}
