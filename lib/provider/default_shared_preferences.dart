import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class DefaultModel {
  Map<String, dynamic> toMap() {
    throw UnimplementedError('DefaultModel.fromMap must be implemented');
  }

  factory DefaultModel.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError(
        'DefaultModel.fromMap must be implemented by subclasses');
  }
}

class DefaultSharedPreferences<T extends DefaultModel> {
  final T Function(Map<String, dynamic>) fromMap;
  DefaultSharedPreferences(this.fromMap);

  Future<bool> save(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(value.toMap());
    return prefs.setString(key, jsonString);
  }

  Future<T?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString == null) return null;
    final jsonMap = json.decode(jsonString);
    return fromMap(jsonMap);
  }

  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  Future<List<String>> getKeys() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> res = prefs.getKeys().toList();
    return res;
  }

  Future<bool> containsKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
