import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/texts.dart';
import 'package:todo_app/views/home/components/incoming_task_info_card.dart';
import 'package:todo_app/views/home/components/task_card.dart';
import 'package:todo_app/views/home/components/ongoing_task_info_card.dart';
import 'package:todo_app/views/task/task_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>> incompleteCardData = [];
  List<Map<String, dynamic>> completeCardData = [];
  final DateTime _time = DateTime.now();

  completed(int i) {
    print("taking data");
    setState(() {
      completeCardData.add(incompleteCardData[i]);
      incompleteCardData.remove(incompleteCardData[i]);
    });
    print("done");
  }

  data(Map<String, dynamic> item) {
    setState(() {
      incompleteCardData.add(item);
    });
  }

  delete(int i) {
    print("Deleting");
    setState(() {
      completeCardData.remove(completeCardData[i]);
    });
    print("done");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
                        AppText.heading2(text: DateFormat.MMM().format(_time)),
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
            incompleteCardData.isEmpty
                ? const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  )
                : SliverToBoxAdapter(
                    child: SizedBox(
                      height: 150,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          scrollDirection: Axis.horizontal,
                          itemCount: incompleteCardData.length,
                          itemBuilder: (context, index) => index == 0
                              ? OngoingTaskInfoCard(
                                  text: incompleteCardData[index]["text"],
                                  time: incompleteCardData[index]["time"],
                                )
                              : IncomingTaskInfoCard(
                                  text: incompleteCardData[index]["text"],
                                  time: incompleteCardData[index]["time"],
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
                          (context, index) => Row(
                                children: [
                                  Expanded(
                                    child: TaskCard(
                                      text: incompleteCardData[index]["text"],
                                      priority: incompleteCardData[index]
                                          ["priority"],
                                      time: incompleteCardData[index]["time"],
                                      category: incompleteCardData[index]
                                          ["category"],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        completed(index);
                                        print("I was just tapped");
                                      },
                                      icon: const Icon(Icons
                                          .radio_button_unchecked_outlined)),
                                ],
                              ),
                          childCount: incompleteCardData.length))
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
                      (context, index) => Row(
                        children: [
                          Expanded(
                            child: TaskCard(
                              text: completeCardData[index]["text"],
                              priority: completeCardData[index]["priority"],
                              time: completeCardData[index]["time"],
                              category: completeCardData[index]["category"],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                delete(index);
                              },
                              icon: const Icon(
                                  Icons.delete_forever_outlined)),
                        ],
                      ),
                      childCount: completeCardData.length,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TaskView(getData: data)));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
