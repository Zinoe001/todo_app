import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/views/home/components/body.dart';
import 'package:todo_app/views/task/task_view.dart';
import 'package:todo_app/widgets/my_list.dart';
import 'package:todo_app/widgets/preference_services.dart';

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

  final MyList _list = MyList();

  bool loading = false;

  List<Map<String, dynamic>> incompleteCardData = [];

  List<Map<String, dynamic>> completeCardData = [];

  getSaved() async {
    await _prefs.init();
    setState((){
      print("getting data from saved list incompletecard");
       incompleteCardData.addAll(_prefs.incompleteDataList);
      print(_prefs.incompleteDataList);
      print("getting data from  saved list completecard");
      completeCardData.addAll(_prefs.completeDataList);
      print(_prefs.completeDataList);
    });
  }

  // function to get data from to do's created in the TaskView
  // and add to incompletedCardData list
  data(Map<String, dynamic> item) {
    print("taking data");
    print(item);
    setState(() {
      incompleteCardData.add(item);
    });
    print(incompleteCardData);
    _prefs.saveIncomplete(incompleteCardData);
    print("done");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: loading
            // if loading is true show a circle_progress_indicator in the center
            ? Center(child: CircularProgressIndicator())
            // if loading is false show the home view
            : Body(
                incompleteCardData: incompleteCardData,
                completeCardData: completeCardData,
              ),
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
