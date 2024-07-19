import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/models/main_category_model.dart';
import 'package:profitnote/providers/default_provider.dart';

class MainCategoryProvider extends DefaultProvider<MainCategoryModel> {
  List<MainCategoryModel> _expenseCategories = [];
  List<MainCategoryModel> _incomeCategories = [];

  List<MainCategoryModel> get expenseCategories => _expenseCategories;
  List<MainCategoryModel> get incomeCategories => _incomeCategories;

  void readCategoryData() async {
    _expenseCategories = await read(Keys.expenseCategoryKey);
    _incomeCategories = await read(Keys.incomeCategoryKey);
  }

  void reorderCategories(SharedPrefKey key, int oldIndex, int newIndex) async {
    final categories = await read(key);
    if (newIndex > oldIndex) newIndex -= 1;
    final movedCategory = categories.removeAt(oldIndex);
    categories.insert(newIndex, movedCategory);
    readCategoryData();
  }

  void reorderItems(
      SharedPrefKey key, int categoryIndex, int oldIndex, int newIndex) async {
    final categories = await read(key);
    if (newIndex > oldIndex) newIndex -= 1;
    final movedItem =
        categories[categoryIndex].subCategories.removeAt(oldIndex);
    categories[categoryIndex].subCategories.insert(newIndex, movedItem);
    await saveItems(key, categories);
    readCategoryData();
  }

  void deleteCategory(SharedPrefKey key, int index) async {
    final categories = await read(key);
    categories.removeAt(index);
    await saveItems(key, categories);
    readCategoryData();
  }

  void deleteItem(SharedPrefKey key, int categoryIndex, int itemIndex) async {
    final categories = await read(key);
    categories[categoryIndex].subCategories.removeAt(itemIndex);
    await saveItems(key, categories);
  }

  void updateCategory(
      SharedPrefKey key, int index, MainCategoryModel newCategory) async {
    final categories = await read(key);
    categories[index] = newCategory;
    await saveItems(key, categories);
    readCategoryData();
  }

  @override
  MainCategoryModel fromMap(Map<String, dynamic> map) {
    return MainCategoryModel.fromMap(map);
  }
}
