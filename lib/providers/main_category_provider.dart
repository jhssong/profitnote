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

  void reorderCategories(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final movedCategory = _expenseCategories.removeAt(oldIndex);
    _expenseCategories.insert(newIndex, movedCategory);
  }

  void reorderItems(int categoryIndex, int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final movedItem =
        _expenseCategories[categoryIndex].subCategories.removeAt(oldIndex);
    _expenseCategories[categoryIndex].subCategories.insert(newIndex, movedItem);
  }

  void deleteCategory(int index) {
    _expenseCategories.removeAt(index);
  }

  void deleteItem(int categoryIndex, int itemIndex) {
    _expenseCategories[categoryIndex].subCategories.removeAt(itemIndex);
  }

  @override
  MainCategoryModel fromMap(Map<String, dynamic> map) {
    return MainCategoryModel.fromMap(map);
  }
}
