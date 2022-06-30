import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/texts.dart';

class NoTodos extends StatelessWidget {
  const NoTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 225,
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/png/no_task.png"),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        AppText.heading3(text: "No Task")
      ],
    );
  }
}
