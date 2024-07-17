import 'dart:convert';
import 'package:profitnote/models/default_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DefaultService<T extends DefaultModel> {
  static Future<void> create<T extends DefaultModel>(
      String key, T item, T Function(Map<String, dynamic> map) fromMap) async {
    final items = await read(key, fromMap);
    items.add(item);
    await saveItems(key, items);
  }

  static Future<List<T>> read<T extends DefaultModel>(
      String key, T Function(Map<String, dynamic> map) fromMap) async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = prefs.getStringList(key) ?? [];
    return itemsJson
        .map((itemJson) => fromMap(json.decode(itemJson)))
        .toList()
        .cast<T>();
  }

  static Future<void> update<T extends DefaultModel>(String key, T oldItem,
      T newItem, T Function(Map<String, dynamic> map) fromMap) async {
    final items = await read(key, fromMap);
    final index = items.indexOf(oldItem);
    if (index != -1) {
      items[index] = newItem;
      await saveItems(key, items);
    }
  }

  static Future<void> delete<T extends DefaultModel>(
      String key, T item, T Function(Map<String, dynamic> map) fromMap) async {
    final items = await read(key, fromMap);
    items.remove(item);
    await saveItems(key, items);
  }

  static Future<void> saveItems<T extends DefaultModel>(
      String key, List<T> newItems) async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson =
        newItems.map((item) => json.encode(item.toMap())).toList();
    await prefs.setStringList(key, itemsJson);
  }
}
