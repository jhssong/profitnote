abstract class DefaultModel {
  Map<String, dynamic> toMap() {
    throw UnimplementedError('DefaultModel.toMap must be implemented');
  }

  factory DefaultModel.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError(
        'DefaultModel.fromMap must be implemented by subclasses');
  }
}
