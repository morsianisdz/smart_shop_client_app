import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {

  static const storage = FlutterSecureStorage();

  Future<void> secureSave(key, value) async {
    await storage.write(key: key, value: value.toString());
  }

  Future<String?> secureRead(key) async {
    return await storage.read(key: key);
  }

  Future<bool> secureCheckKey(key) async {
    return await storage.containsKey(key: key);
  }

  Future<void> secureDelete(key) async {
    return await storage.delete(key: key);
  }

  Future<void> shpSaveString(key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> shpSaveInt(key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<void> shpSaveBool(key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<String?> shpReadString(key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<int?> shpReadInt(key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<bool?> shpReadBool(key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<bool> checkKey(key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  Future<bool> remove(key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

}
