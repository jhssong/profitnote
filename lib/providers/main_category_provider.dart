import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/constants/examples.dart';
import 'package:profitnote/models/main_category_model.dart';
import 'package:profitnote/providers/default_provider.dart';
import 'package:profitnote/services/default_service.dart';
import 'package:profitnote/services/main_category_service.dart';

class MainCategoryProvider extends DefaultProvider<MainCategoryModel> {
  @override
  DefaultService<MainCategoryModel> createService() {
    return MainCategoryService();
  }

  Future<void> initializeCategories() async {
    List<MainCategoryModel> expenseCategories = expenseMainCategories
        .map((map) => MainCategoryModel.fromMap(map))
        .toList();
    saveItems(Keys.expenseCategoryKey, expenseCategories);

    List<MainCategoryModel> incomeCategories = incomeMainCategories
        .map((map) => MainCategoryModel.fromMap(map))
        .toList();
    saveItems(Keys.incomeCategoryKey, incomeCategories);
  }

  Future<void> saveItems(String key, List<MainCategoryModel> newItems) async {
    service.saveItems(key, newItems);
  }
}
