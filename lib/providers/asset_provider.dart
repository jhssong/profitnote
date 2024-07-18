import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/models/asset_model.dart';
import 'package:profitnote/providers/default_provider.dart';

class AssetProvider extends DefaultProvider<AssetModel> {
  List<AssetModel> _assets = [];

  List<AssetModel> get assets => _assets;

  void readAssetData() async {
    _assets = await read(Keys.assetKey);
  }

  @override
  AssetModel fromMap(Map<String, dynamic> map) {
    return AssetModel.fromMap(map);
  }

  AssetModel getItemById(int id) {
    return _assets.firstWhere((item) => item.id == id);
  }
}
