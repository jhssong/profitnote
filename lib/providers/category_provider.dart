import 'package:profitnote/providers/default_provider.dart';

class MainCategoryProvider extends DefaultProvider<MainCategory> {
  MainCategoryProvider() : super('expenseCategory');
  final List<Map<String, dynamic>> mainCategories = [
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
  Future<void> initializeCategories() async {
    List<MainCategory> categories =
        mainCategories.map((map) => MainCategory.fromMap(map)).toList();
    saveItems(categories);
  }

  @override
  MainCategory fromMap(Map<String, dynamic> map) {
    return MainCategory.fromMap(map);
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
