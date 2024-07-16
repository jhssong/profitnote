import 'package:profitnote/models/default_model.dart';

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
