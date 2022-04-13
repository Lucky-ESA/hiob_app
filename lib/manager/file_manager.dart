import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home/manager/manager.dart';

class FileManager {
  SharedPreferences pref;
  bool isLoaded = false;
  final Manager manager;

  FileManager({required this.pref, required this.manager}) {
    //_init();
  }

  /*void _init() async {
    pref = await SharedPreferences.getInstance();
    isLoaded = true;
  }*/

  Future<bool> writeJSON(String key, Map<String, dynamic> content) async {
    return await pref.setString(key, jsonEncode(content));
  }

  Future<bool> writeJSONList(String key, List<dynamic> content) async {
    return await pref.setString(key, jsonEncode(content));
  }

  Future<bool> writeString(String key, String content) async {
    return await pref.setString(key, content);
  }

  Future<bool> writeInt(String key, int content) async {
    return await pref.setInt(key, content);
  }

  Future<bool> writeBool(String key, bool content) async {
    return await pref.setBool(key, content);
  }

  Future<bool> writeDouble(String key, double content) async {
    return await pref.setDouble(key, content);
  }

  Future<bool> containsKey(String key) async {
    return pref.containsKey(key);
  }

  Future<String?> getString(String key) async {
    return pref.getString(key);
  }

  Future<bool?> getBool(String key) async {
    return pref.getBool(key);
  }
  Future<double?> getDouble(String key) async {
    return pref.getDouble(key);
  }

  Future<int?> getInt(String key) async {
    return pref.getInt(key);
  }

  Future<Map<String, dynamic>?> getMap(String key) async {
    return jsonDecode(pref.getString(key)!);

  }
  Future<List<dynamic>?> getList(String key) async {
    if(pref.containsKey(key)) {
      return jsonDecode(pref.getString(key)!);
    } else {
      return null;
    }

  }

  void export(BuildContext context) async {
    //TODO: Add IOS Support
    String?  result = await FilePicker.platform.getDirectoryPath(dialogTitle: 'Please select an output file:',);
    if(result == null) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Exporting...")));
    try {
      print(result);
      File myFile = File(result + "/exportHioB.json");
      Map<String,dynamic> data = {
        "devices": jsonEncode(manager.deviceManager.devicesList),
        "widgets": jsonEncode(manager.customWidgetManager.templates),
        "screens": jsonEncode(manager.screenManager.screens)
      };
      String t = jsonEncode(data);
      await myFile.writeAsString(t, mode: FileMode.write);
    } catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error exporting!")));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Export Successful")));
  }
  void import(BuildContext context) async {
    //TODO: Add IOS Support
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowedExtensions: ["json"], type: FileType.custom, dialogTitle: "Dialog", withData: true);
    if(result == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Select File to import!"), duration: Duration(seconds: 1),));
    } else {
      try {
        Uint8List fileBytes = result.files.first.bytes!;
        String t = String.fromCharCodes(fileBytes.toList());
        Map<String, dynamic> map = jsonDecode(t);
        pref.setString(manager.deviceManager.key, map["devices"]);
        pref.setString(manager.customWidgetManager.templateKey, map["widgets"]);
        pref.setString(manager.screenManager.key, map["screens"]);
        manager.deviceManager.reload();
        manager.screenManager.reload();
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text("Error importing! " + e.toString())));
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Import Successful")));
    }
  }
}