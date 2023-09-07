import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cursos {
  final String nombre;
  final Color color;

  Cursos({required this.nombre, this.color = Colors.white});
}

final cursos = <Cursos>[
  Cursos(nombre: "Matematica", color: Colors.blue),
  Cursos(nombre: "Lenguaje programacion II", color: Colors.purple),
  Cursos(nombre: "Base de Datos", color: Colors.yellow),
  Cursos(nombre: "Ingles", color: Colors.green),
  Cursos(nombre: "Investigacion de Operaciones", color: Colors.red),
  Cursos(nombre: "Taller de Software", color: Colors.orange),
];

class BuildCoursesList extends StatefulWidget {
  const BuildCoursesList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BuildCoursesListState createState() => _BuildCoursesListState();
}

class _BuildCoursesListState extends State<BuildCoursesList> {
  List<String?> attendanceStatus = List<String?>.filled(cursos.length, null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: cursos.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 70.0,
            child: Slidable(
              actionPane: const SlidableDrawerActionPane(),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Asistió',
                  color: Colors.green,
                  icon: Icons.check,
                  onTap: () => _setAttendanceStatus(index, 'Asistió'),
                ),
                IconSlideAction(
                  caption: 'Tardanza',
                  color: Colors.orange,
                  icon: Icons.access_time,
                  onTap: () => _setAttendanceStatus(index, 'Tardanza'),
                ),
                IconSlideAction(
                  caption: 'Faltó',
                  color: Colors.red,
                  icon: Icons.close,
                  onTap: () => _setAttendanceStatus(index, 'Faltó'),
                ),
              ],
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: cursos[index].color,
                ),
                onPressed: () {
                  // Acción del botón al presionarlo (si es necesario)
                },
                child: Text(cursos[index].nombre),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15.0); // Espacio entre las filas
        },
      ),
    );
  }

  _setAttendanceStatus(int index, String status) {
    setState(() {
      attendanceStatus[index] = status;
    });
  }
}
