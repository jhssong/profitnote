import 'package:profitnote/models/default_model.dart';

class AssetGroupModel implements DefaultModel {
  final int id;
  final String name;
  final List<int> assetItems;

  AssetGroupModel({
    required this.id,
    required this.name,
    required this.assetItems,
  });

  factory AssetGroupModel.fromMap(Map<String, dynamic> map) {
    return AssetGroupModel(
      id: map['id'],
      name: map['name'],
      assetItems: List<int>.from(map['assetItems']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'assetItems': assetItems,
    };
  }
}
