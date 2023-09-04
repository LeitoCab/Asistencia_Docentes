import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HorarioPage extends StatefulWidget {
  const HorarioPage({super.key});

  @override
  State<HorarioPage> createState() => _HorarioPageState();
}

class Curso {
  final String curso;
  final String inicio;
  final String fin;
  final String aula;
  final int dia; // 1 = Lunes, 2 = Martes, ..., 7 = Domingo
  const Curso(this.curso, this.inicio, this.fin, this.aula, this.dia);
}

// ignore: unused_element
List<Curso> _filteredCursos = [];

class _HorarioPageState extends State<HorarioPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime kFirstDay = DateTime.utc(2023, 1, 1);
  DateTime kLastDay = DateTime.utc(2024, 12, 31);

  List<Curso> cursos = [
    const Curso(
        'Seminario de tesis I', '18:00', '22:00', 'Laboratorio Moore', 1),
    const Curso('Gestion de TI', '19:00', '23:00', 'Aula 04', 1),
    const Curso('Peritaje informatico', '15:00', '17:00', 'Aula 03', 1),
    const Curso('Taller de software 2', '12:00', '14:00', 'Aula 02', 1),
    // Añade otros cursos para otros días si lo deseas
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                _filteredCursos = cursos
                    .where((curso) => curso.dia == _selectedDay!.weekday)
                    .toList();
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            // La siguiente función ahora sólo devuelve una lista vacía, porque no estamos usando eventos en el calendario.
            // Si deseas mostrar eventos en los días del calendario, deberías modificar esta función.
            eventLoader: (day) => [],
          ),
          const SizedBox(height: 16),
          _buildEventList()
        ],
      ),
    );
  }

  Widget _buildEventList() {
    if (_filteredCursos.isEmpty) {
      return const Center(
        child: Text('No hay cursos'),
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: _filteredCursos.length,
        itemBuilder: (context, index) {
          Curso curso = _filteredCursos[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              title: Text(curso.curso),
              subtitle: Text(curso.aula),
              trailing: Text(curso.inicio + ' - ' + curso.fin),
            ),
          );
        },
      ),
    );
  }
}
