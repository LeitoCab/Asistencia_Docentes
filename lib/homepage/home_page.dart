import 'package:asistencia_de_docentes/homepage/drawer_home.dart';
import 'package:asistencia_de_docentes/tabbar/asistencia.dart';
import 'package:asistencia_de_docentes/tabbar/horario.dart';
import 'package:flutter/material.dart';

import '../routes/routes_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Nombre del Docente",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Asistencia'),
              Tab(text: 'Horario'),
            ],
          ),
        ),
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      const CircleAvatarDrawer(),
                      const Divider(),
                      ExpansionTile(
                        leading: const Icon(Icons.person),
                        title: const Text("Datos"),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: const Icon(Icons.account_circle),
                              title: const Text('Nombre: '),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: const Icon(Icons.account_circle),
                              title: const Text('Apellido Paterno: '),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: const Icon(Icons.account_circle),
                              title: const Text('Apellido Materno: '),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: const Icon(Icons.mail_outline),
                              title: const Text('Email: '),
                              onTap: () {},
                            ),
                          ),
                          // Puedes añadir más campos relacionados con el usuario aquí
                        ],
                      ),
                      const Divider(),
                      ExpansionTile(
                        leading: const Icon(Icons.info_outline),
                        title: const Text("Acerca de Nosotros"),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: const Icon(Icons.mail),
                              title: const Text("Correo Electrónico"),
                              subtitle: const Text("kfkevin@gmail.com"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: const Icon(Icons.phone),
                              title: const Text("Teléfono"),
                              subtitle: const Text("921 899 332"),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.exit_to_app),
                        title: const Text("Cerrar sesión"),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.login);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: BuildCoursesList(),
            ),
            Center(
              child: HorarioPage(),
            ),
          ],
        ),
      ),
    );
  }
}
