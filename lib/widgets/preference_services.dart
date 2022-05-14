
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/widgets/stored_keys.dart';

class PreferenceServices{

 late SharedPreferences _preferences;

  Future<void> init() async {
    
    _preferences = await SharedPreferences.getInstance();
    print("getting stored incompleteCard");
    getIncomplete();
    print("getting stored completeCard");
    getComplete();
    
  }

  List<Map<String,dynamic>> incompleteDataList = [];
  List<Map<String,dynamic>>  completeDataList= [];

  Future<void> saveIncomplete(List<Map<String, dynamic>> item) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(StoredKeys.keyIncomplete, jsonEncode(item));
    print(jsonEncode(item));
  }

  Future<void> saveCompleted(List<Map<String, dynamic>> item) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(StoredKeys.keyCompleted, jsonEncode(item));
    print(jsonEncode(item));
  }

  Future<void> getIncomplete() async {
    
  List<Map<String,dynamic>> incompleteData= [];
    incompleteData = jsonDecode(
            _preferences.getString(StoredKeys.keyIncomplete) ?? <String>[].toString())
        .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
        .toList();
        incompleteDataList.addAll(incompleteData);
    print(incompleteData);
  }

  Future<void> getComplete() async {
  List<Map<String,dynamic>>  completeData= [];
    completeData = jsonDecode(
            _preferences.getString(StoredKeys.keyCompleted) ?? <String>[].toString())
        .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
        .toList();
        completeDataList.addAll(completeData);
    print(completeData);
  }

  Future<void> removeComplete() async{
    _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
    print("Remove Successfully");
  }

   Future<void> removeIncomplete() async{
     _preferences = await SharedPreferences.getInstance();
    _preferences.remove(StoredKeys.keyIncomplete,);
    print("Remove Successfully");
  }
}