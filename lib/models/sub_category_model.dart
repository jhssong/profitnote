import 'package:profitnote/models/default_model.dart';

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
