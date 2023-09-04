import 'package:asistencia_de_docentes/homepage/drawer_home.dart';
import 'package:asistencia_de_docentes/tabbar/asistencia.dart';
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
            "Asistencia de docentes UNAP",
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
                      Divider(),
                      ExpansionTile(
                        leading: Icon(Icons.person),
                        title: const Text("Datos"),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: Icon(Icons.account_circle),
                              title: Text('Nombre: Juan Pérez'),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: Icon(Icons.mail_outline),
                              title: Text('Email: juan.perez@example.com'),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: Icon(Icons.phone),
                              title: Text('Teléfono: +123456789'),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      ExpansionTile(
                        leading: Icon(Icons.info_outline),
                        title: const Text("Acerca de Nosotros"),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: Icon(Icons.mail),
                              title: const Text("Correo Electrónico"),
                              subtitle: const Text("soporte@unap.edu"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: ListTile(
                              leading: Icon(Icons.phone),
                              title: const Text("Teléfono"),
                              subtitle: const Text("921 899 332"),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: const Text("Cerrar sesión"),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.login);
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Versión 3.0",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(220, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            BuildCoursesList(), // Para "Asistencia"
            Container(),
          ],
        ),
      ),
    );
  }
}
