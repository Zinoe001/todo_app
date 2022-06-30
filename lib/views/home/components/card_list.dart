import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/views/home/components/task_card.dart';
import 'package:todo_app/widgets/todo_functions.dart';

class CardList extends StatelessWidget {
  CardList(
      {Key? key,
      required this.index,
      required this.cardListData,
      required this.onTap,
      this.delete = false})
      : super(key: key);
  final int index;
  final List<Map<String, dynamic>> cardListData;
  final Function() onTap;
  final bool delete;
  final TodoFunctions _functions = TodoFunctions();
  @override
  Widget build(BuildContext context) {
    return delete
        ? Row(
            children: [
              Expanded(
                child: TaskCard(
                  completed: delete,
                  color: delete
                      ? Color(0XFF666666)
                      : _functions.buildColor(
                          cardListData[index]["priority"].toString(),
                        ),
                  text: cardListData[index]["text"],
                  priority: cardListData[index]["priority"].toString(),
                  time: cardListData[index]["time"],
                  date: cardListData[index]["date"],
                  category: cardListData[index]["category"],
                ),
              ),
              IconButton(
                  onPressed: () => onTap(),
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                    color: Color(0XFF666666),
                  )),
            ],
          )
        : Row(
            children: [
              IconButton(
                  onPressed: () => onTap(),
                  icon: Icon(
                    Icons.radio_button_unchecked_outlined,
                    color: kPrimaryColor,
                  )),
              Expanded(
                child: TaskCard(
                  completed: delete,
                  color: delete
                      ? Color(0XFF666666)
                      : _functions.buildColor(
                          cardListData[index]["priority"].toString(),
                        ),
                  text: cardListData[index]["text"],
                  priority: cardListData[index]["priority"].toString(),
                  time: cardListData[index]["time"],
                  date: cardListData[index]["date"],
                  category: cardListData[index]["category"],
                ),
              ),
            ],
          );
  }
}
