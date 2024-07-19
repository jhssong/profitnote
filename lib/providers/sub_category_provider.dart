import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/models/sub_category_model.dart';
import 'package:profitnote/providers/default_provider.dart';

class SubCategoryProvider extends DefaultProvider<SubCategoryModel> {
  List<SubCategoryModel> _subCategories = [];

  List<SubCategoryModel> get subCategories => _subCategories;

  void readCategoryData() async {
    _subCategories = await read(Keys.subCategoryKey);
    notifyListeners();
  }

  void updateItem(int categoryId, SubCategoryModel newCategory) async {
    final categories = await read(Keys.subCategoryKey);
    final index =
        categories.indexWhere((category) => category.id == categoryId);
    if (index != -1) {
      categories[index] = newCategory;
      await saveItems(Keys.subCategoryKey, categories);
      readCategoryData();
    } else {
      throw Exception('Category with ID $categoryId not found');
    }
  }

  // void deleteItem(int index) async {
  //   final categories = await read(Keys.subCategoryKey);
  //   final index =
  //       categories.indexWhere((category) => category.id == categoryId);
  //   if (index != -1) {
  //     categories[index].isVisible = false;
  //   }
  // }

  SubCategoryModel getSubCategoryById(int id) {
    return subCategories.firstWhere((subCategory) => subCategory.id == id);
  }

  @override
  SubCategoryModel fromMap(Map<String, dynamic> map) {
    return SubCategoryModel.fromMap(map);
  }
}
