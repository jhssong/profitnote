import 'package:profitnote/models/default_model.dart';

class Asset implements DefaultModel {
  int id;
  String name;
  int group;
  double initialValue;
  String linkedApp;
  String memo;
  double currentValue;
  bool isVisible;

  Asset({
    required this.id,
    required this.name,
    required this.group,
    required this.initialValue,
    required this.linkedApp,
    required this.memo,
    required this.currentValue,
    required this.isVisible,
  });

  factory Asset.fromMap(Map<String, dynamic> map) {
    return Asset(
      id: map['id'],
      name: map['name'],
      group: map['group'],
      initialValue: map['initialValue'],
      linkedApp: map['linkedApp'],
      memo: map['memo'],
      currentValue: map['currentValue'],
      isVisible: map['isVisible'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'group': group,
      'initialValue': initialValue,
      'linkedApp': linkedApp,
      'memo': memo,
      'currentValue': currentValue,
      'isVisible': isVisible,
    };
  }
}
