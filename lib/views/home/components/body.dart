// ignore_for_file: must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:todo_app/core/services/preference_services.dart';
import 'package:todo_app/core/utils/texts.dart';
import 'package:todo_app/views/home/components/todo_date.dart';
import 'package:todo_app/views/home/components/todo_list.dart';
import 'package:todo_app/views/home/components/todo_slide.dart';
import 'package:todo_app/views/home/components/no_todos.dart';

class Body extends StatefulWidget {
  Body(
      {Key? key,
      required this.completeCardData,
      required this.incompleteCardData})
      : super(key: key);

  List<Map<String, dynamic>> incompleteCardData;

  List<Map<String, dynamic>> completeCardData;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final int position;

  final PreferenceServices _prefs = PreferenceServices();

  late List<Map<String, dynamic>> undoneCardData = [];

  late Timer timer;

  @override
  void initState() {
    position = 0;
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 15), (Timer t) => check(widget.incompleteCardData));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  check(List<Map<String, dynamic>> item) {
    if (item.isNotEmpty) {
      final first = item.first;
      DateTime date = DateTime.fromMillisecondsSinceEpoch(first["date"]);
      bool hasPassed = DateTime.now().isAfter(date);
      if (hasPassed) {
        item.removeAt(0);
        undoneCardData.insert(0, first);
        setState(() {
          undoneCardData;
          _prefs.saveUndone(undoneCardData);
          item;
        });
      }
    }
  }

// function to get data from incompleteCardData list
  // and add to completedCardData list
  // and delete that particular dataItem
  // from the list of data in incompletCardData list
  addIncomplete(int index) {
    setState(() {
      widget.completeCardData.add(widget.incompleteCardData[index]);
      _prefs.saveCompleted(widget.completeCardData);
      widget.incompleteCardData.remove(widget.incompleteCardData[index]);
      _prefs.saveIncomplete(widget.incompleteCardData);
    });
  }

  addUndone(int index) {
    setState(() {
      widget.completeCardData.add(undoneCardData[index]);
      _prefs.saveCompleted(widget.completeCardData);
      undoneCardData.remove(undoneCardData[index]);
      _prefs.saveUndone(undoneCardData);
    });
  }

  // function to delete that particular dataItem
  // from the list of data in completCardData list
  remove(index) {
    setState(() {
      widget.completeCardData.remove(widget.completeCardData[index]);
      _prefs.saveCompleted(widget.completeCardData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          snap: true,
          title: AppText.heading5(
            text: "TODOLIST",
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: TodoDate(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverPinnedHeader(
            child: Container(
              height: 25,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText.heading4(text: "All Tasks"),
                ],
              ),
            ),
          ),
        ),
        widget.incompleteCardData.isEmpty &&
                widget.completeCardData.isEmpty &&
                undoneCardData.isEmpty
            ? SliverToBoxAdapter(child: NoTodos())
            : MultiSliver(
                children: [
                  widget.incompleteCardData.isEmpty
                      ? const SliverToBoxAdapter(
                          child: SizedBox(height: 10),
                        )
                      : SliverToBoxAdapter(
                          child: SizedBox(
                              height: 150,
                              child: TodoSlide(
                                todos: widget.incompleteCardData,
                              )),
                        ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: MultiSliver(
                      children: [
                        TodoList(
                          index: position,
                          title: "Tasks",
                          item: widget.incompleteCardData,
                          onTap: () {
                            addIncomplete(position);
                          },
                        ),
                        TodoList(
                          index: position,
                          title: "Undone Tasks",
                          item: undoneCardData,
                          onTap: () {
                            addUndone(position);
                          },
                        ),
                        TodoList(
                          index: position,
                          title: "Completed Tasks",
                          item: widget.completeCardData,
                          delete: true,
                          onTap: () {
                            remove(position);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
      ],
    );
  }
}
