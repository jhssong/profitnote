import 'package:profitnote/providers/default_provider.dart';

class SubCategoryProvider extends DefaultProvider<SubCategory> {
  SubCategoryProvider();
  List<Map<String, dynamic>> subCategories = [
    {"id": 1, "name": "외식", "amount": 0, "isVisible": true},
    {"id": 2, "name": "식료품", "amount": 0, "isVisible": true},
    {"id": 3, "name": "정기 적금", "amount": 0, "isVisible": true},
    {"id": 4, "name": "비상금", "amount": 0, "isVisible": true},
  ];

  Future<void> initializeCategories() async {
    List<SubCategory> categories =
        subCategories.map((map) => SubCategory.fromMap(map)).toList();
    saveItems('subCategory', categories);
  }

  @override
  SubCategory fromMap(Map<String, dynamic> map) {
    return SubCategory.fromMap(map);
  }
}

class SubCategory implements DefaultModel {
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

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'isVisible': isVisible,
    };
  }
}
