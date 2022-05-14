import 'package:flutter/material.dart';
// import 'package:todo_app/widgets/preference_services.dart';

class TodoFunctions {

// TodoFunctions(
//       {Key? key,
//       required this.completeCardData,
//       required this.incompleteCardData
//       })
//       : super();

  //  List<Map<String, dynamic>> incompleteCardData = [];

  //  List<Map<String, dynamic>> completeCardData = [];

  // final PreferenceServices _prefs = PreferenceServices();

  // // function to get data from to do's created in the TaskView
  // // and add to incompletedCardData list
  // data(Map<String, dynamic> item) {
  //   print("taking data");
  //   print(item);
  //     incompleteCardData.add(item);
  //   print(incompleteCardData);
  //   _prefs.saveIncomplete(incompleteCardData);
  //   print("done");
  // }

  //   // function to delete that particular dataItem
  //  // from the list of data in completCardData list
 //     delete(index) {
 //     print("Deleting");
 //     setState(() {
 //       widget.completeCardData.remove(widget.completeCardData[index]);
 //     });
 //     print("done");
 //   }
 
  // // function to get data from incompleteCardData list
  // // and add to completedCardData list
  // // and delete that particular dataItem
  // // from the list of data in incompletCardData list
  // add(int index) {
  //   print("taking data");
  //   completeCardData.add(incompleteCardData[index]);
  //   _prefs.saveCompleted(completeCardData);
  //   incompleteCardData.remove(incompleteCardData[index]);
  //   print(completeCardData);
  //   print("done");
  // }

// function to assign a partclar color to the level of priority
// in the list of data in incompletCardData & completCardData list
  buildColor(String value) {
    switch (value) {
      case "High":
        return Color(0XFFFF0000);
      case "Normal":
        return Color(0XFF29CC36);
      case "Low":
        return Color(0XFFEDFD2F);

      default:
        return Color(0XFF666666);
    }
  }
}
