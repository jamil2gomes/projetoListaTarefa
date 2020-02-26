import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class JsonHelper{

  static JsonHelper _databaseHelper;

  JsonHelper._createInstance();

  factory JsonHelper() {
    if (_databaseHelper == null)
      _databaseHelper = JsonHelper._createInstance();

    return _databaseHelper;
  }

  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> saveData(List toDoList) async {
    String data = json.encode(toDoList);

    final file = await getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}