import 'package:profitnote/models/default_model.dart';

class SubCategoryModel implements DefaultModel {
  final int id;
  final String name;
  final bool isVisible;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.isVisible,
  });

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['id'],
      name: map['name'],
      isVisible: map['isVisible'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isVisible': isVisible,
    };
  }
}
