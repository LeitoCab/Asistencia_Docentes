import 'package:asistencia_de_docentes/routes/routes.dart';
import 'package:flutter/material.dart';

import 'routes/routes_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: Routes.login,
    );
  }
}
