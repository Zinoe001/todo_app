import 'package:flutter/material.dart';
import 'package:todo_app/views/home/components/task_card.dart';
import 'package:todo_app/views/home/components/todo_functions.dart';

class CompleteCard extends StatefulWidget {
  const CompleteCard({Key? key, required this.index, required this.completeCardData, required this.ontap})
      : super(key: key);
  final int index;
  final List<Map<String, dynamic>> completeCardData;
  final Function() ontap;

  @override
  State<CompleteCard> createState() => _CompleteCardListState();
}

class _CompleteCardListState extends State<CompleteCard> {

  List<Map<String, dynamic>> incompleteCardData = [];

  List<Map<String, dynamic>> completeCardData = [];

  final TodoFunctions _functions = TodoFunctions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            // adding dataItem to completedCardData
            onPressed: () {
              print("about to delete");
              widget.ontap();
              print("deleted");
            },
            icon: const Icon(Icons.delete_forever_outlined)),
        Expanded(
          child: TaskCard(
            // assigning data to TaskCard, from the list of map completeCardData
            color: _functions.buildColor(
              widget.completeCardData[widget.index]["priority"].toString(),
            ),
            text: widget.completeCardData[widget.index]["text"],
            priority:
                widget.completeCardData[widget.index]["priority"].toString(),
            time: widget.completeCardData[widget.index]["time"],
            category: widget.completeCardData[widget.index]["category"],
          ),
        ),
      ],
    );
  }
}
