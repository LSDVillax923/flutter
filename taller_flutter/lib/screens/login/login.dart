import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taller_flutter/screens/login/bloc/login_in_bloc.dart';
import 'package:taller_flutter/screens/login/bloc/login_in_event.dart';
import 'package:taller_flutter/screens/login/bloc/login_in_state.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginInBloc(),
      child: BlocBuilder<LoginInBloc,LoginInState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                // Fondo
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/fondolog.png',
                    fit: BoxFit.cover,
                  ),
                ),

                // Contenido principal
                Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo
                        Padding(
                          padding: const EdgeInsets.only(bottom: 175),
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 200,
                            height: 200,
                          ),
                        ),

                        // Título
                        const Text(
                          'Bienvenido a Nocta',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 16),

                        SignForm(
                          onEmailChanged: (value) => {
                            context.read<LoginInBloc>().add(EmailChanged(value)),
                          },
                          onPasswordChanged: (value) {
                            context.read<LoginInBloc>().add(PasswordChanged(value));
                          },
                        ),

                        const SizedBox(height: 16),

                        // Botón de iniciar sesión
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: state.isValid
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey, // gris cuando no es válido
                            ),
                            onPressed: state.isValid
                                ? () {
                                    context.go('/bar_reviews');
                                  }
                                : null, // cuando es null, el botón queda deshabilitado
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),


                        const SizedBox(height: 8),

                        // Botón de Sign Up -> /register
                        SignUpButton(
                          onPressed: () {
                            context.push('/register');
                          },
                        ),

                        const SizedBox(height: 16),

                        // Enlace "¿Olvidaste tu contraseña?" -> /reset_password
                        GestureDetector(
                          onTap: () {
                            context.push('/reset_password');
                          },
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  final void Function()? onPressed;

  const SignUpButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// SignForm: aquí vive TODA la lógica de los TextField de email y password
/// ---------------------------------------------------------------------------
class SignForm extends StatelessWidget {
  final Function(String) onEmailChanged;
  final Function(String) onPasswordChanged;

  const SignForm({
    super.key,
    required this.onEmailChanged,
    required this.onPasswordChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Campo de correo
        TextField(
          decoration: InputDecoration(
            labelText: 'Correo o Usuario',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.9),
          ),
          onChanged: (value) => {onEmailChanged(value), print(value)}
        ),

        const SizedBox(height: 8),

        // Campo de contraseña
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.9),
          ),
          onChanged:  (value) => {onPasswordChanged(value), print(value)},
        ),
      ],
    );
  }
}
