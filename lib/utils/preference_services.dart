import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class PreferenceServices{
  late final SharedPreferences _preferences;
   Future init() async => _preferences = await SharedPreferences.getInstance();
List<Map<String,dynamic>> item = [];
 static const _keyList = "list";
 Future saveList() async {
   await _preferences.setString(_keyList, jsonEncode(item));
 }
 Future getList()async{
   item = List.from(jsonDecode(_preferences.getString(_keyList)!));

 }
}