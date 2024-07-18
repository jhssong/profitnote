import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/models/asset_group_model.dart';
import 'package:profitnote/providers/default_provider.dart';

class AssetGroupProvider extends DefaultProvider<AssetGroupModel> {
  List<AssetGroupModel> _assetGroups = [];

  List<AssetGroupModel> get assetGroups => _assetGroups;

  void readAssetGroupData() async {
    _assetGroups = await read(Keys.assetGroupKey);
  }

  @override
  AssetGroupModel fromMap(Map<String, dynamic> map) {
    return AssetGroupModel.fromMap(map);
  }
}
