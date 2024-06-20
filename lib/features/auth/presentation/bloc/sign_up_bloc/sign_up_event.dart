abstract class SignUpEvent{}

class SignUpButtonPressed extends SignUpEvent{
  final String userName;
  final String phoneNumber;

  SignUpButtonPressed({required this.userName, required this.phoneNumber});
}