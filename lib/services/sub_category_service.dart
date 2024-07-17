import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/constants/examples.dart';
import 'package:profitnote/models/sub_category_model.dart';
import 'package:profitnote/services/default_service.dart';

class SubCategoryService extends DefaultService<SubCategoryModel> {
  static Future<void> initializeCategories() async {
    List<SubCategoryModel> subCategories = subCategoriesExample
        .map((map) => SubCategoryModel.fromMap(map))
        .toList();
    DefaultService.saveItems(Keys.subCategoryKey, subCategories);
  }
}
