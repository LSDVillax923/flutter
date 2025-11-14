class LoginInState {
  final String email;
  final String password;
  final bool isValid;

  LoginInState({
    this.email = '',
    this.password = '',
    this.isValid = false,
  });

  LoginInState copyWith({
    String? email,
    String? password,
    bool? isValid,
  }) {
    return LoginInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }
}