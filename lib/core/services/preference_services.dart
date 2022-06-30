import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/widgets/stored_keys.dart';

class PreferenceServices {
  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    getIncomplete();
    getComplete();
    getUndone();
  }

  List<Map<String, dynamic>> incompleteDataList = [];
  List<Map<String, dynamic>> completeDataList = [];
  List<Map<String, dynamic>> undoneDataList = [];

  Future<void> saveIncomplete(List<Map<String, dynamic>> item) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(StoredKeys.keyIncomplete, jsonEncode(item));
  }

  Future<void> saveUndone(List<Map<String, dynamic>> item) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(StoredKeys.keyUndone, jsonEncode(item));
  }

  Future<void> saveCompleted(List<Map<String, dynamic>> item) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(StoredKeys.keyCompleted, jsonEncode(item));
  }

  Future<void> getIncomplete() async {
    List<Map<String, dynamic>> incompleteData = [];
    incompleteData = jsonDecode(
            _preferences.getString(StoredKeys.keyIncomplete) ??
                <String>[].toString())
        .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
        .toList();
    incompleteDataList.addAll(incompleteData);
  }

  Future<void> getUndone() async {
    List<Map<String, dynamic>> undoneData = [];
    undoneData = jsonDecode(_preferences.getString(StoredKeys.keyUndone) ??
            <String>[].toString())
        .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
        .toList();
    undoneDataList.addAll(undoneData);
  }

  Future<void> getComplete() async {
    List<Map<String, dynamic>> completeData = [];
    completeData = jsonDecode(_preferences.getString(StoredKeys.keyCompleted) ??
            <String>[].toString())
        .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
        .toList();
    completeDataList.addAll(completeData);
  }

  Future<void> removeComplete() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
  }

  Future<void> removeIncomplete() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.remove(
      StoredKeys.keyIncomplete,
    );
  }

  Future<void> removeUndone() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.remove(
      StoredKeys.keyUndone,
    );
  }
}
