import 'package:asistencia_de_docentes/botons/edit_button.dart';
import 'package:asistencia_de_docentes/routes/routes_config.dart';

import 'package:asistencia_de_docentes/textfield/edit_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 35,
        ),
        child: ListView(children: [
          Column(
            children: [
              const Center(
                child: Text(
                  'Control de asistencia de docentes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Center(
                child: Image.asset(
                  "assets/unap.jpg",
                  width: 162,
                  height: 235,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const Row(
                children: [
                  Text(
                    "Inicio de Sesion",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const SizedBox(
                height: 14,
              ),
              const Row(
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const EditTextField(
                  hintText: "Email",
                  icon: Icons.email,
                  labeltext: "tuemail@tuemail.com"),
              const SizedBox(
                height: 14,
              ),
              const Row(
                children: [
                  Text(
                    "Contraseña",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const EditTextField(
                  hintText: "Password",
                  icon: Icons.password,
                  labeltext: "Escriba su contraseña"),
              const SizedBox(
                height: 14,
              ),
              EditButton(
                  text: "Iniciar Sesion",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.homePage);
                  }),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
