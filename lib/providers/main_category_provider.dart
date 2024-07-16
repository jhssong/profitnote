import 'package:profitnote/providers/default_provider.dart';

class MainCategoryProvider extends DefaultProvider<MainCategory> {
  MainCategoryProvider();
  final List<Map<String, dynamic>> expenseMainCategories = [
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

  final List<Map<String, dynamic>> incomeMainCategories = [
    {
      "id": 1,
      "name": "월급",
      "type": 0,
      "subCategories": [1, 2],
      "isVisible": true
    },
    {
      "id": 2,
      "name": "기타",
      "type": 0,
      "subCategories": [3, 4],
      "isVisible": true
    },
  ];

  Future<void> initializeCategories() async {
    List<MainCategory> expenseCategories =
        expenseMainCategories.map((map) => MainCategory.fromMap(map)).toList();
    saveItems('expenseCategory', expenseCategories);

    List<MainCategory> incomeCategories =
        incomeMainCategories.map((map) => MainCategory.fromMap(map)).toList();
    saveItems('incomeCategory', incomeCategories);
  }

  @override
  MainCategory fromMap(Map<String, dynamic> map) {
    return MainCategory.fromMap(map);
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
