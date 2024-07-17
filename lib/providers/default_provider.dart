import 'package:flutter/material.dart';
import 'package:profitnote/models/default_model.dart';
import 'package:profitnote/services/default_service.dart';

abstract class DefaultProvider<T extends DefaultModel> with ChangeNotifier {
  T fromMap(Map<String, dynamic> map);

  Future<void> create(String key, T item) async {
    await DefaultService.create(key, item, fromMap);
    notifyListeners();
  }

  Future<List<T>> read(String key) async {
    List<T> res = await DefaultService.read(key, fromMap);
    notifyListeners();
    return res;
  }

  Future<void> update(String key, T oldItem, T newItem) async {
    await DefaultService.update(key, oldItem, newItem, fromMap);
    notifyListeners();
  }

  Future<void> delete(String key, T item) async {
    await DefaultService.delete(key, item, fromMap);
    notifyListeners();
  }

  Future<void> saveItems(String key, List<T> newItems) async {
    await DefaultService.saveItems(key, newItems);
    notifyListeners();
  }
}
