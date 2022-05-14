import 'package:flutter/material.dart';
import 'package:todo_app/views/home/components/task_card.dart';
import 'package:todo_app/views/home/components/todo_functions.dart';


class IncompleteCard extends StatefulWidget {
  const IncompleteCard(
      {Key? key, required this.index, required this.incompleteCardData,required this.onTap})
      : super(key: key);
  final int index;
  final List<Map<String, dynamic>> incompleteCardData;
  final Function() onTap;

  @override
  State<IncompleteCard> createState() => _IncompleteCardListState();
}

class _IncompleteCardListState extends State<IncompleteCard> {
 

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
              print("I was just tapped");           
               widget.onTap();  
                print("Fucntion is working"); 
            },
            icon: const Icon(Icons.radio_button_unchecked_outlined)),
        Expanded(
          child: TaskCard(
            // assigning data to TaskCard, from the list of map incompleteCardData
            color: _functions.buildColor(
              widget.incompleteCardData[widget.index]["priority"].toString(),
            ),
            text: widget.incompleteCardData[widget.index]["text"],
            priority:
                widget.incompleteCardData[widget.index]["priority"].toString(),
            time: widget.incompleteCardData[widget.index]["time"],
            category: widget.incompleteCardData[widget.index]["category"],
          ),
        ),
      ],
    );
  }
}
