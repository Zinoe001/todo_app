import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class PreferenceServices{
  late final SharedPreferences _preferences;
   
   PreferenceServices(){
     init();
   }
   Future init() async => _preferences = await SharedPreferences.getInstance();

 static const _keyMap = "map";

 Future saveMap(Map<String,dynamic> item) async {
   await _preferences.setString(_keyMap, jsonEncode(item));
 }
 
 Future getList(List<Map<String,dynamic>> item)async{
   item = List.from(jsonDecode(_preferences.getString(_keyMap) ?? <Map<String,dynamic>>[].toString()));

 }
}