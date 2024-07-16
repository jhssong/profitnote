import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:profitnote/models/default_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DefaultProvider<T extends DefaultModel> with ChangeNotifier {
  Future<List<T>> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = prefs.getStringList(key) ?? [];
    return itemsJson
        .map((itemJson) => fromMap(json.decode(itemJson)))
        .toList()
        .cast<T>();
  }

  Future<void> save(String key, T item) async {
    final items = await read(key);
    items.add(item);
    await saveItems(key, items);
  }

  Future<void> remove(String key, T item) async {
    final items = await read(key);
    items.remove(item);
    await saveItems(key, items);
  }

  Future<void> update(String key, T oldItem, T newItem) async {
    final items = await read(key);
    final index = items.indexOf(oldItem);
    if (index != -1) {
      items[index] = newItem;
      await saveItems(key, items);
    }
  }

  Future<void> saveItems(String key, List<T> newItems) async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson =
        newItems.map((item) => json.encode(item.toMap())).toList();
    await prefs.setStringList(key, itemsJson);
    notifyListeners();
  }

  T fromMap(Map<String, dynamic> map);
}
