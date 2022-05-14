import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:todo_app/utils/texts.dart';
import 'package:todo_app/views/home/components/complete_card.dart';
import 'package:todo_app/views/home/components/incoming_task_info_card.dart';
import 'package:todo_app/views/home/components/incomplete_card.dart';
import 'package:todo_app/views/home/components/no_todos.dart';
import 'package:todo_app/views/home/components/ongoing_task_info_card.dart';
import 'package:todo_app/widgets/preference_services.dart';

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
  final DateTime _time = DateTime.now();

  late final int position;

  final PreferenceServices _prefs = PreferenceServices();

// function to get data from incompleteCardData list
  // and add to completedCardData list
  // and delete that particular dataItem
  // from the list of data in incompletCardData list
  add(int index) {
    print("taking data");
    setState(() {
      widget.completeCardData.add(widget.incompleteCardData[index]);
      _prefs.saveCompleted(widget.completeCardData);
      widget.incompleteCardData.remove(widget.incompleteCardData[index]);
       _prefs.saveIncomplete(widget.incompleteCardData);
    });
    print(widget.completeCardData);
    print("done");
  }

  // function to delete that particular dataItem
 // from the list of data in completCardData list
  delete(index) {
    print("Deleting");
    setState(() {
      widget.completeCardData.remove(widget.completeCardData[index]);
      _prefs.saveCompleted(widget.completeCardData);
    });
    print("done");
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          snap: true,
          leading: const Icon(
            Icons.window_outlined,
            color: Colors.white,
            size: 25,
          ),
          title: Center(
              child: AppText.heading5(
            text: "HOME",
          )),
          actions: [
            Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
        widget.incompleteCardData.isEmpty && widget.completeCardData.isEmpty
            ? SliverToBoxAdapter(child: NoTodos())
            : MultiSliver(children: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppText.heading1(text: _time.day.toString()),
                            const SizedBox(
                              width: 8,
                            ),
                            AppText.heading2(
                                text: DateFormat.MMM().format(_time)),
                            const Spacer(),
                            const Icon(Icons.calendar_month_outlined),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        AppText.heading6(
                          text: "TODAY",
                          color: const Color(0XFF666666),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                widget.incompleteCardData.isEmpty
                    ? const SliverToBoxAdapter(
                        child: SizedBox(height: 10),
                      )
                    : SliverToBoxAdapter(
                        child: SizedBox(
                          height: 150,
                          child: ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.incompleteCardData.length,
                              itemBuilder: (context, position) =>
                                  // checking the position of the list, if it equals to zero
                                  position == 0
                                      ?
                                      // if the position is true
                                      OngoingTaskInfoCard(
                                          // assigning data to TaskInfoCard, from the list of map incompleteCardData
                                          text: widget
                                                  .incompleteCardData[position]
                                              ["text"],
                                          time: widget
                                                  .incompleteCardData[position]
                                              ["time"],
                                        )
                                      :
                                      // if the position is false
                                      IncomingTaskInfoCard(
                                          // assigning data to TaskInfoCard, from the list of map incompleteCardData
                                          text: widget
                                                  .incompleteCardData[position]
                                              ["text"],
                                          time: widget
                                                  .incompleteCardData[position]
                                              ["time"],
                                        )),
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
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: MultiSliver(
                    children: [
                      SliverPinnedHeader(
                        child: Container(
                          color: Colors.white,
                          height: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText.heading6(text: "Incompleted"),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, position) => IncompleteCard(
                                  index: position,
                                  incompleteCardData: widget.incompleteCardData,
                                  onTap: () {
                                    print("removing from incompleted Card");
                                    add(position);
                                    print("remove Successful");
                                  }),
                              childCount: widget.incompleteCardData.length))
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: MultiSliver(
                    children: [
                      SliverPinnedHeader(
                        child: Container(
                          color: Colors.white,
                          height: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText.heading6(text: "Completed"),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, position) => CompleteCard(
                              ontap: () => delete(position),
                              index: position,
                              completeCardData: widget.completeCardData),
                          childCount: widget.completeCardData.length,
                        ),
                      )
                    ],
                  ),
                ),
              ])
      ],
    );
  }
}
