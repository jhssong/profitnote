import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/models/main_category_model.dart';
import 'package:profitnote/providers/default_provider.dart';

class MainCategoryProvider extends DefaultProvider<MainCategory> {
  Future<void> initializeCategories() async {
    List<MainCategory> expenseCategories =
        expenseMainCategories.map((map) => MainCategory.fromMap(map)).toList();
    saveItems('expenseCategory', expenseCategories);

    List<MainCategory> incomeCategories =
        incomeMainCategories.map((map) => MainCategory.fromMap(map)).toList();
    saveItems('incomeCategory', incomeCategories);
  }

  @override
  MainCategory fromMap(Map<String, dynamic> map) {
    return MainCategory.fromMap(map);
  }
}
