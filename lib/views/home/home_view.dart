import 'package:flutter/material.dart';
import 'package:todo_app/core/services/preference_services.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/views/home/components/body.dart';
import 'package:todo_app/views/task/task_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    setState(() {
      loading = true;
    });
    getSaved();
    setState(() {
      loading = false;
    });
    super.initState();
  }

  final PreferenceServices _prefs = PreferenceServices();

  bool loading = false;

  List<Map<String, dynamic>> incompleteCardData = [];

  List<Map<String, dynamic>> completeCardData = [];

  late final int index;

  getSaved() async {
    await _prefs.init();
    setState(() {
      incompleteCardData.addAll(_prefs.incompleteDataList);
      completeCardData.addAll(_prefs.completeDataList);
    });
  }
// final TodoFunctions _functions = TodoFunctions();

  // function to get data from to do's created in the TaskView
  // and add to incompletedCardData list
  data(Map<String, dynamic> item) {
    setState(() {
      incompleteCardData.add(item);
      incompleteCardData.sort((a, b) => a["date"].compareTo(b["date"]));
    });
    _prefs.saveIncomplete(incompleteCardData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Body(
              incompleteCardData: incompleteCardData,
              completeCardData: completeCardData,
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          // navigating to TaskView
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
