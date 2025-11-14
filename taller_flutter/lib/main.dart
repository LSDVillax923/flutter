import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taller_flutter/screens/barDetail.dart';
import 'package:taller_flutter/screens/barReviews/bar_reviews.dart';
import 'package:taller_flutter/screens/create.dart';
import 'package:taller_flutter/screens/edite_profile.dart';
import 'package:taller_flutter/screens/login/login.dart';
import 'package:taller_flutter/screens/register.dart';
import 'package:taller_flutter/screens/reset_password.dart';
import 'package:taller_flutter/screens/settings.dart';
import 'package:taller_flutter/screens/profile.dart';


final _router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const Login()),
  GoRoute(path: "/register", builder: (context, state) => const Register()),
  GoRoute(path: "/reset_password", builder: (context, state) => const ResetPassword()),
  GoRoute(path: "/profile", builder: (context, state) => const Profile()),
  GoRoute(path: "/edit_profile", builder: (context, state) => const EditProfile()),
  GoRoute(path: "/settings", builder: (context, state) => const Settings()),
  GoRoute(path: "/create", builder: (context, state) => const Create()),
  GoRoute(path: "/bar_reviews", builder: (context, state) => const BarReviews()),
  GoRoute(path: "/bar_detail/:gastroBarId", builder: (context, state) {
    final gastroBarId = state.pathParameters['gastroBarId']!;
    return DetailGastroBarScreen(gastroBarId: gastroBarId);
  }),
  ]);


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
