import 'package:asistencia_de_docentes/botons/edit_button.dart';
import 'package:asistencia_de_docentes/routes/routes_config.dart';
import 'package:asistencia_de_docentes/textfield/edit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:asistencia_de_docentes/mixins/form_mixin.dart'; // No olvides importar tu mixin

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with FormMixin<LoginPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Añade una clave para tu formulario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 35,
        ),
        child: ListView(
          children: [
            Form(
              key: _formKey, // Agrega la clave aquí
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'Control de asistencia de docentes',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  EditTextField(
                    controller: _emailController, // Añade el controlador aquí
                    hintText: "Email",
                    icon: Icons.email,
                    labeltext: "tuemail@tuemail.com",
                    validator: emailValidator, // Aquí usas tu validador
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Contraseña",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
                      if (_formKey.currentState?.validate() ?? false) {
                        // Si todo está validado correctamente, navega a la siguiente página
                        Navigator.pushNamed(context, Routes.homePage);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
