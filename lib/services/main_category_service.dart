import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/constants/examples.dart';
import 'package:profitnote/models/main_category_model.dart';
import 'package:profitnote/services/default_service.dart';

class MainCategoryService extends DefaultService<MainCategoryModel> {
  static Future<void> initializeCategories() async {
    List<MainCategoryModel> expenseCategories = expenseMainCategoriesExample
        .map((map) => MainCategoryModel.fromMap(map))
        .toList();
    DefaultService.saveItems(Keys.expenseCategoryKey, expenseCategories);

    List<MainCategoryModel> incomeCategories = incomeMainCategoriesExample
        .map((map) => MainCategoryModel.fromMap(map))
        .toList();
    DefaultService.saveItems(Keys.incomeCategoryKey, incomeCategories);
  }
}
