import 'package:asistencia_de_docentes/homepage/drawer_home.dart';
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
            child: ListView(
              children: <Widget>[
                const CircleAvatarDrawer(),
                ListTile(
                  title: const Text("Datos del docente"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Cerrar sesión"),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.login);
                  },
                )
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("Contenido de la pestaña 1"),
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
