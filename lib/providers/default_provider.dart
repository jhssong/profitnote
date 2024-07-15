import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DefaultModel {
  Map<String, dynamic> toMap() {
    throw UnimplementedError('DefaultModel.fromMap must be implemented');
  }

  factory DefaultModel.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError(
        'DefaultModel.fromMap must be implemented by subclasses');
  }
}

abstract class DefaultProvider<T extends DefaultModel> with ChangeNotifier {
  List<T> _items = [];
  List<T> get items => _items;

  final String _key;

  DefaultProvider(this._key) {
    _loadItems();
  }

  void save(T item) async {
    _items.add(item);
    await _saveItems();
    notifyListeners();
  }

  void remove(T item) async {
    _items.remove(item);
    await _saveItems();
    notifyListeners();
  }

  void update(T oldItem, T newItem) async {
    final index = _items.indexOf(oldItem);
    if (index != -1) {
      _items[index] = newItem;
      await _saveItems();
      notifyListeners();
    }
  }

  void saveItems(List<T> newItems) async {
    _items = newItems;
    await _saveItems();
    notifyListeners();
  }

  Future<void> _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = _items.map((item) => json.encode(item.toMap())).toList();
    await prefs.setStringList(_key, itemsJson);
  }

  Future<void> _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = prefs.getStringList(_key) ?? [];
    _items = itemsJson
        .map((itemJson) => fromMap(json.decode(itemJson)))
        .toList()
        .cast<T>();
    notifyListeners();
  }

  T fromMap(Map<String, dynamic> map);
}
