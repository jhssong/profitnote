import 'package:profitnote/models/sub_category_model.dart';
import 'package:profitnote/services/default_service.dart';

class SubCategoryService extends DefaultService<SubCategoryModel> {
  @override
  SubCategoryModel fromMap(Map<String, dynamic> map) {
    return SubCategoryModel.fromMap(map);
  }
}
