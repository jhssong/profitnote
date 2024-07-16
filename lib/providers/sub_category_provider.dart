import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/models/sub_category_model.dart';
import 'package:profitnote/providers/default_provider.dart';

class SubCategoryProvider extends DefaultProvider<SubCategory> {
  Future<void> initializeCategories() async {
    List<SubCategory> categories =
        subCategories.map((map) => SubCategory.fromMap(map)).toList();
    saveItems('subCategory', categories);
  }

  @override
  SubCategory fromMap(Map<String, dynamic> map) {
    return SubCategory.fromMap(map);
  }
}
