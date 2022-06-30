import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/texts.dart';

class TodoDate extends StatefulWidget {
  TodoDate({Key? key}) : super(key: key);

  @override
  State<TodoDate> createState() => _TodoDateState();
}

class _TodoDateState extends State<TodoDate> {
  final DateTime _time = DateTime.now();

  late int? selected = _time.day.toInt() - 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
        AppText.heading6(
          text: "TODAY",
          color: const Color(0XFF666666),
        ),
        const SizedBox(
          width: 8,
        ),
        AppText.heading2(text: DateFormat.MMMEd().format(_time)),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
