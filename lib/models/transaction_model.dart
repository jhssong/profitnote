import 'package:profitnote/models/default_model.dart';
import 'package:profitnote/models/split_model.dart';

enum TransactionType { expense, income, transfer }

class TransactionModel implements DefaultModel {
  int id;
  TransactionType type;
  DateTime datetime;
  int asset;
  double price;
  String title;
  int mainCategory;
  int subCategory;
  String memo;
  List<SplitModel> split;

  TransactionModel({
    required this.id,
    required this.type,
    required this.datetime,
    required this.asset,
    required this.price,
    required this.title,
    required this.mainCategory,
    required this.subCategory,
    required this.memo,
    required this.split,
  });

  // Convert a Map into a Transaction object
  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      type: TransactionType.values[map['type']],
      datetime: DateTime.parse(map['datetime']),
      asset: map['asset'],
      price: map['price'],
      title: map['title'],
      mainCategory: map['mainCategory'],
      subCategory: map['subCategory'],
      memo: map['memo'],
      split: (map['split'] as List)
          .map((item) => SplitModel.fromMap(item))
          .toList(),
    );
  }

  // Convert a Transaction object into a Map
  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.index,
      'datetime': datetime.toString(),
      'asset': asset,
      'price': price,
      'title': title,
      'mainCategory': mainCategory,
      'subCategory': subCategory,
      'memo': memo,
      'split': split.map((item) => item.toMap()).toList(),
    };
  }
}
