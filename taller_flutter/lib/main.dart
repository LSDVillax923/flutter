import 'package:flutter/material.dart';
import 'package:taller_flutter/screens/bar_reviews.dart';
import 'package:taller_flutter/screens/create.dart';
import 'package:taller_flutter/screens/edite_profile.dart';
import 'package:taller_flutter/screens/login.dart';
import 'package:taller_flutter/screens/register.dart';
import 'package:taller_flutter/screens/reset_password.dart';
import 'package:taller_flutter/screens/settings.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BarReviews(gastroBarName: "Cris"));
  }
}
