import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/constants/examples.dart';
import 'package:profitnote/models/sub_category_model.dart';
import 'package:profitnote/providers/default_provider.dart';
import 'package:profitnote/services/default_service.dart';
import 'package:profitnote/services/sub_category_service.dart';

class SubCategoryProvider extends DefaultProvider<SubCategoryModel> {
  Future<void> initializeCategories() async {
    List<SubCategoryModel> categories =
        subCategories.map((map) => SubCategoryModel.fromMap(map)).toList();
    saveItems(Keys.subCategoryKey, categories);
  }

  Future<void> saveItems(String key, List<SubCategoryModel> newItems) async {
    service.saveItems(key, newItems);
  }

  @override
  DefaultService<SubCategoryModel> createService() {
    return SubCategoryService();
  }
}
