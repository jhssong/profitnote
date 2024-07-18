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

  @override
  SubCategoryModel fromMap(Map<String, dynamic> map) {
    return SubCategoryModel.fromMap(map);
  }
}
