import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taller_flutter/screens/login/bloc/login_in_event.dart';
import 'package:taller_flutter/screens/login/bloc/login_in_state.dart';

class LoginInBloc extends Bloc<LoginInEvent, LoginInState> {
  LoginInBloc() : super(LoginInState()) {
    on<EmailChanged>((event, emit) {
      final newEmail = event.email;

      emit(
        state.copyWith(
          email: newEmail,
          isValid: _validate(newEmail, state.password),
        ),
      );
    });

    on<PasswordChanged>((event, emit) {
      final newPassword = event.password;

      emit(
        state.copyWith(
          password: newPassword,
          isValid: _validate(state.email, newPassword),
        ),
      );
    });

    on<LoginButtonPressed>((event, emit) {
      // Aquí iría la lógica para manejar el inicio de sesión
      // por ejemplo: llamar a un use case, repo, etc.
    });
  }

  bool _validate(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }
}
