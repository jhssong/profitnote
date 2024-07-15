import 'package:flutter/material.dart';
import 'package:profitnote/provider/default_shared_preferences.dart';

class DefaultProvider<T extends DefaultModel> with ChangeNotifier {
  final DefaultSharedPreferences _sharedPreferences;
  T? _value;

  DefaultProvider(this._sharedPreferences);

  T? get value => _value;
  DefaultSharedPreferences get sharedPreferences => _sharedPreferences;

  Future<bool> read(String key) async {
    try {
      final loadedValue = await _sharedPreferences.read(key);
      _value = loadedValue as T?;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> save(String key, T value) async {
    try {
      await _sharedPreferences.save(key, value);
      _value = value;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> remove(String key) async {
    try {
      await _sharedPreferences.remove(key);
      _value = null;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update(String key, T value) async {
    try {
      await _sharedPreferences.save(key, value);
      _value = value;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
