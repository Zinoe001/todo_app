// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/views/home/components/todo_info_card.dart';

class TodoSlide extends StatelessWidget {
  TodoSlide({Key? key, required this.todos}) : super(key: key);
  List<Map<String, dynamic>> todos;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      scrollDirection: Axis.horizontal,
      itemCount: todos.length,
      itemBuilder: (context, position) =>
          // checking the position of the list, if it equals to zero
          position == 0
              ?
              // if the position is true
              TodoInfoCard(
                  // assigning data to TaskInfoCard, from the list of map incompleteCardData
                  title: "Ongoing",
                  text: todos[position]["text"],
                  time: todos[position]["time"],
                )
              :
              // if the position is false
              TodoInfoCard(
                  // assigning data to TaskInfoCard, from the list of map incompleteCardData
                  title: "Incoming",
                  text: todos[position]["text"],
                  time: todos[position]["time"],
                ),
    );
  }
}
