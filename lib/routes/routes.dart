import 'package:asistencia_de_docentes/login/login_page.dart';
import 'package:flutter/material.dart';
import '../homepage/home_page.dart';
import 'routes_config.dart';

Map<String, Widget Function(BuildContext context)> get routes {
  return {
    Routes.login: (context) => const LoginPage(),
    Routes.homePage: (context) => const HomePage(),
  };
}
