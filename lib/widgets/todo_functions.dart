import 'package:flutter/material.dart';
import 'package:todo_app/core/services/preference_services.dart';

class TodoFunctions {
  List<Map<String, dynamic>> incompleteCardData = [];

  List<Map<String, dynamic>> completeCardData = [];

  final PreferenceServices _prefs = PreferenceServices();

  // function to get data from to do's created in the TaskView
  // and add to incompletedCardData list

  data(Map<String, dynamic> item, List<Map<String, dynamic>> list) {
    incompleteCardData.add(item);
    incompleteCardData.addAll(incompleteCardData);
    list = incompleteCardData;
    _prefs.saveIncomplete(incompleteCardData);
  }

  //   // function to delete that particular dataItem
  //  // from the list of data in completCardData list
  //     delete(index) {
  //     print("Deleting");
  //     setState(() {
  //       completeCardData.remove(completeCardData[index]);
  //     });
  //     print("done");
  //   }

  // function to get data from incompleteCardData list
  // and add to completedCardData list
  // and delete that particular dataItem
  // from the list of data in incompletCardData list
  add(int index, {required List<Map<String, dynamic>> item}) {
    completeCardData.add(incompleteCardData[index]);
    _prefs.saveCompleted(completeCardData);
    incompleteCardData.remove(incompleteCardData[index]);
    incompleteCardData.addAll(incompleteCardData);
    completeCardData.addAll(completeCardData);
    item = completeCardData;
    _prefs.saveIncomplete(incompleteCardData);
  }

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

  int getDays() {
    DateTime x1 = DateTime(DateTime.now().year, DateTime.now().month);
    DateTime x2 = DateTime(DateTime.now().year, DateTime.now().month + 1);
    var diff = x2.difference(x1).inDays;
    return diff;
  }
}
