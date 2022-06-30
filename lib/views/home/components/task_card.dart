import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/texts.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.text,
    required this.category,
    required this.time,
    required this.priority,
    required this.color,
    this.completed = false,
    required this.date,
  }) : super(key: key);
  final String? text;
  final String category;
  final String time;
  final int date;
  final String priority;
  final Color color;
  final bool completed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: completed
              ? Border.all(color: Color(0XFF666666))
              : Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(15)),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.heading6(text: text ?? ""),
              const SizedBox(
                height: 7,
              ),
              AppText.small(text: category),
              const SizedBox(
                height: 3,
              ),
              AppText.small(text: time),
            ],
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 10,
              width: 35,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: AppText.small(
                text: priority,
                color: Colors.white,
              )),
            ),
            const SizedBox(
              height: 7,
            ),
            AppText.small(
                text: DateFormat.MMMd()
                    .format(DateTime.fromMillisecondsSinceEpoch(date))),
          ],
        ),
      ]),
    );
  }
}
