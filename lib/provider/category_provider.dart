import 'package:profitnote/provider/default_provider.dart';
import 'package:profitnote/provider/default_shared_preferences.dart';

class CategoryProvider extends DefaultProvider {
  CategoryProvider()
      : super(DefaultSharedPreferences<MainCategory>(MainCategory.fromMap));

  Future<void> initializeCategories() async {
    List<String> keys = await sharedPreferences.getKeys();
    if (keys.isEmpty) {
      List<Map<String, dynamic>> mainCategoriesMap = [
        {
          "id": 1,
          "name": "식비",
          "type": 0,
          "subCategories": [1, 2],
          "isVisible": true
        },
        {
          "id": 2,
          "name": "저축",
          "type": 0,
          "subCategories": [3, 4],
          "isVisible": true
        },
      ];
      var categories =
          mainCategoriesMap.map((map) => MainCategory.fromMap(map)).toList();

      for (var category in categories) {
        await save(category.id.toString(), category);
      }

      notifyListeners();
    }
  }

  Future<bool> saveCategories(List<MainCategory> categories) async {
    try {
      categories.map((category) => save(category.id.toString(), category));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<MainCategory>> readCategories() async {
    List<String> keys = await sharedPreferences.getKeys();
    List<MainCategory> res = [];
    for (String key in keys) {
      MainCategory? category =
          await sharedPreferences.read(key) as MainCategory;
      res.add(category);
    }
    return res;
  }
}

class SubCategory {
  final int id;
  final String name;
  final int amount;
  final bool isVisible;

  SubCategory({
    required this.id,
    required this.name,
    required this.amount,
    required this.isVisible,
  });

  factory SubCategory.fromMap(Map<String, dynamic> map) {
    return SubCategory(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
      isVisible: map['isVisible'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'isVisible': isVisible,
    };
  }
}

class MainCategory implements DefaultModel {
  final int id;
  final String name;
  final int type;
  final List<int> subCategories;
  final bool isVisible;

  MainCategory({
    required this.id,
    required this.name,
    required this.type,
    required this.subCategories,
    required this.isVisible,
  });

  @override
  factory MainCategory.fromMap(Map<String, dynamic> map) {
    return MainCategory(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      subCategories: List<int>.from(map['subCategories']),
      isVisible: map['isVisible'],
    );
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'subCategories': subCategories,
      'isVisible': isVisible,
    };
  }
}
