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
  const Curso(this.curso, this.inicio, this.fin, this.aula);
}

List<Curso> _filteredCursos = [];

class _HorarioPageState extends State<HorarioPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime kFirstDay = DateTime.utc(2023, 1, 1);
  DateTime kLastDay = DateTime.utc(2024, 12, 31);
  List<Curso> cursos = [
    const Curso('Seminario de tesis I', '19:00', '23:00', 'Laboratorio Moore'),
    const Curso('Gestion de TI', '19:00', '23:00', 'Aula 04'),
    const Curso('Peritaje informatico', '19:00', '23:00', 'Aula 04'),
    const Curso('Taller de software 2', '19:00', '23:00', 'Aula 04')
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
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                if (_selectedDay!.weekday == DateTime.monday) {
                  _filteredCursos = cursos
                      .where((curso) =>
                          curso.inicio == "19:00" && curso.fin == "23:00")
                      .toList();
                } else {
                  _filteredCursos = [];
                }
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
            eventLoader: (day) {
              if (day.weekday == DateTime.monday) {
                return [
                  const Curso('Seminario de tesis I', '19:00', '23:00',
                      'Laboratorio Moore'),
                  const Curso('Gestion de TI', '19:00', '23:00', 'Aula 04'),
                ];
              }
              return [];
            },
          ),
          const SizedBox(
            width: 16,
          ),
          _buildEventList()
        ],
      ),
    );
  }

  Widget _buildEventList() {
    if (cursos.isEmpty) {
      return const Center(
        child: Text('No hay cursos'),
      );
    }
    return ListView(
      children: cursos.map((curso) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text("Curso: "),
            subtitle: Text(curso.aula),
            trailing: Text(curso.inicio + ' - ' + curso.fin),
          ),
        );
      }).toList(),
    );
  }
}
