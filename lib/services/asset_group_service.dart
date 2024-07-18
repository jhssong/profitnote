import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/constants/examples.dart';
import 'package:profitnote/models/asset_group_model.dart';
import 'package:profitnote/services/default_service.dart';

class AssetGroupService extends DefaultService<AssetGroupModel> {
  static Future<void> initializeAssetGroups() async {
    List<AssetGroupModel> assetGroups =
        assetGroupExamples.map((map) => AssetGroupModel.fromMap(map)).toList();
    DefaultService.saveItems(Keys.assetGroupKey, assetGroups);
  }
}
