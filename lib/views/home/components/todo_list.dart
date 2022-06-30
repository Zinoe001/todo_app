import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:todo_app/core/utils/texts.dart';
import 'package:todo_app/views/home/components/card_list.dart';

class TodoList extends StatelessWidget {
  TodoList(
      {Key? key,
      required this.title,
      required this.item,
      required this.onTap,
      this.delete = false,
      required this.index})
      : super(key: key);

  final String title;
  final List<Map<String, dynamic>> item;
  final Function() onTap;
  final bool delete;
  final int index;
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverPinnedHeader(
          child: Container(
            color: Colors.white,
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText.heading6(text: title),
              ],
            ),
          ),
        ),
        item.isEmpty
            ? SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                  child: Center(
                    child: AppText.heading3(text: "No Task"),
                  ),
                ),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => CardList(
                      index: index,
                      cardListData: item,
                      delete: delete,
                      onTap: onTap),
                  childCount: item.length,
                ),
              )
      ],
    );
  }
}
