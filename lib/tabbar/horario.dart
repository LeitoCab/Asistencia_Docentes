import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:logger/logger.dart';

class HorarioPage extends StatefulWidget {
  const HorarioPage({super.key});

  @override
  State<HorarioPage> createState() => _HorarioPageState();
}

class _HorarioPageState extends State<HorarioPage> {
  var logger = Logger();
  DateTime selectedDay = DateTime.now();
  late List<CleanCalendarEvent> selectedEvent; // Inicialización de la lista
  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent('Evento A',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'Un evento especial',
          color: Colors.blue),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      CleanCalendarEvent('Evento B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          description: 'Un evento especial',
          color: Colors.orange),
      CleanCalendarEvent('Evento C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          description: 'Un evento especial',
          color: Colors.pink),
    ],
  };
  void _handleData(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    logger.d(selectedDay);
  }

  @override
  void initState() {
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Calendar(
        startOnMonday: true,
        selectedColor: Colors.blue,
        todayColor: Colors.red,
        eventColor: Colors.green,
        eventDoneColor: Colors.amber,
        bottomBarColor: Colors.deepOrange,
        onRangeSelected: (range) {
          logger.i('selected Day ${range.from},${range.to}');
        },
        onDateSelected: (date) {
          return _handleData(date);
        },
        events: events,
        isExpanded: true,
        dayOfWeekStyle: const TextStyle(
          color: Colors.black12,
          fontWeight: FontWeight.w100,
          fontSize: 15,
        ),
        bottomBarTextStyle: const TextStyle(color: Colors.white),
        hideBottomBar: false,
        hideArrows: false,
        weekDays: const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      ),
    ]));
  }
}
