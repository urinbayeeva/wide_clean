abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileScrolled extends ProfileState {
  final double scrollOffset;
  final bool isScrolled;

  ProfileScrolled(this.scrollOffset) : isScrolled = scrollOffset > 0;
}
