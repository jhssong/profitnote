import 'package:profitnote/models/main_category_model.dart';
import 'package:profitnote/services/default_service.dart';

class MainCategoryService extends DefaultService<MainCategoryModel> {
  @override
  MainCategoryModel fromMap(Map<String, dynamic> map) {
    return MainCategoryModel.fromMap(map);
  }
}
