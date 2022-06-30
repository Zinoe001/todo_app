import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/texts.dart';
import 'package:todo_app/views/task/components/create_todo_card.dart';

class TaskView extends StatefulWidget {
  const TaskView({Key? key, required this.getData}) : super(key: key);
  final Function(Map<String, dynamic>) getData;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kPrimaryColor,
                  kPrimaryLightColor,
                ]),
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              AppText.heading1(
                text: "Create",
                color: Colors.white,
              ),
              AppText.heading1(
                text: "Task",
                color: Colors.white,
              ),
              const SizedBox(
                height: 24,
              ),
              CreateTodoCard(getTask: widget.getData),
            ],
          ),
        ),
      ),
    );
  }
}
