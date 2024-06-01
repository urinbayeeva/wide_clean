abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileScrolled extends ProfileState {
  final bool isScrolled;

  ProfileScrolled(this.isScrolled);
}
