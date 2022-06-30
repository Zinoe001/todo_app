import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/texts.dart';
class DateTimeCard extends StatelessWidget {
  const DateTimeCard(
      {Key? key,
      required this.title,
      this.time,
      required this.message,
      required this.onTap,
      required this.icon,
      required this.size})
      : super(key: key);

  final String title;
  final String? time;
  final String message;
  final Function() onTap;
  final double size;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.body(
          text: title,
          color: Colors.white,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: size,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: AppText.body(text: time == null ? message : time!),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
