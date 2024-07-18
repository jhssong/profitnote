import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/constants/examples.dart';
import 'package:profitnote/models/asset_model.dart';
import 'package:profitnote/services/default_service.dart';

class AssetService extends DefaultService<AssetModel> {
  static Future<void> initialzeAssets() async {
    List<AssetModel> assets =
        assetModelExamples.map((map) => AssetModel.fromMap(map)).toList();
    DefaultService.saveItems(Keys.assetKey, assets);
  }
}
