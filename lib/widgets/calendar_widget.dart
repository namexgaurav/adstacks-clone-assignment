import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: TableCalendar(
        firstDay: DateTime(2000),
        lastDay: DateTime(2100),
        focusedDay: DateTime.now(),
        headerVisible: false,
      ),
    );
  }
}
