import 'package:flutter/material.dart';
import 'package:todo_app/utils/texts.dart';

class IncomingTaskInfoCard extends StatelessWidget {
  const IncomingTaskInfoCard({
    Key? key,
    required this.text,
    required this.time,
  }) : super(key: key);
  final String text;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      width: 150,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 5),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.body(
            text: "Incoming",
            color: Colors.black,
          ),
          Expanded(
              child: AppText.heading3(
            text: text,
            color: Colors.black,
            multilines: true,
          )),
          const SizedBox(
            height: 4,
          ),
          AppText.caption(
            text: time,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
