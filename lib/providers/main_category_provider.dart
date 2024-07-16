import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/constants/examples.dart';
import 'package:profitnote/models/main_category_model.dart';
import 'package:profitnote/providers/default_provider.dart';

class MainCategoryProvider extends DefaultProvider<MainCategoryModel> {
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

  @override
  MainCategoryModel fromMap(Map<String, dynamic> map) {
    return MainCategoryModel.fromMap(map);
  }
}
