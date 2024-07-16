import 'package:profitnote/models/default_model.dart';

class SplitModel implements DefaultModel {
  int id;
  String asset;
  String name;
  double amount;
  bool received;

  SplitModel({
    required this.id,
    required this.asset,
    required this.name,
    required this.amount,
    required this.received,
  });

  // Convert a Map into a Split object
  factory SplitModel.fromMap(Map<String, dynamic> map) {
    return SplitModel(
      id: map['id'],
      asset: map['asset'],
      name: map['name'],
      amount: map['amount'],
      received: map['received'],
    );
  }

  // Convert a Split object into a Map
  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'asset': asset,
      'name': name,
      'amount': amount,
      'received': received,
    };
  }
}
