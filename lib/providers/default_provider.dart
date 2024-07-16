import 'package:flutter/material.dart';
import 'package:profitnote/models/default_model.dart';
import 'package:profitnote/services/default_service.dart';

abstract class DefaultProvider<T extends DefaultModel> with ChangeNotifier {
  late DefaultService<T> service;

  defaultProvider() {
    service = createService();
  }

  DefaultService<T> createService();

  Future<List<T>> read(String key) async {
    List<T> res = await service.read(key);
    notifyListeners();
    return res;
  }

  Future<void> save(String key, T item) async {
    await service.save(key, item);
    notifyListeners();
  }

  Future<void> remove(String key, T item) async {
    await service.remove(key, item);
    notifyListeners();
  }

  Future<void> update(String key, T oldItem, T newItem) async {
    await service.update(key, oldItem, newItem);
    notifyListeners();
  }
}
