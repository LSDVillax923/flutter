abstract class LoginInEvent {}

class EmailChanged extends LoginInEvent {
  final String email;

  EmailChanged(this.email);
}

class PasswordChanged extends LoginInEvent {
  final String password;

  PasswordChanged(this.password);
}

class LoginButtonPressed extends LoginInEvent {
  final String username;
  final String password;

  LoginButtonPressed({required this.username, required this.password});
}

