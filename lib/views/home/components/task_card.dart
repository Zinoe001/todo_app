import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/texts.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.text,
    required this.category,
    required this.time,
    required this.priority, 
    required this.color,
  }) : super(key: key);
  final String? text;
  final String category;
  final String time;
  final String priority;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
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
            AppText.small(text: priority),
            const SizedBox(
              height: 7,
            ),
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
            )
          ],
        ),
      ]),
    );
  }
   

}
