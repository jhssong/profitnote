import 'package:flutter/material.dart';
import 'package:profitnote/providers/asset_group_provider.dart';
import 'package:profitnote/providers/asset_provider.dart';
import 'package:profitnote/screens/asset/widgets/asset_card.dart';
import 'package:provider/provider.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({super.key});

  // TODO Asset Model 완성 후 특정 자산 클릭 시 해당 자산의 결재 내역을 보여주는 modal로 이동하는 기능 추가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자산"),
      ),
      body: SingleChildScrollView(
        child: Consumer2<AssetGroupProvider, AssetProvider>(
            builder: (context, group, item, child) {
          return Column(
            children: [
              for (int groupIndex = 0;
                  groupIndex < group.assetGroups.length;
                  groupIndex++)
                AssetCard(
                  title: group.assetGroups[groupIndex].name,
                  assetListInGroup: [
                    for (int itemIndex = 0;
                        itemIndex <
                            group.assetGroups[groupIndex].assetItems.length;
                        itemIndex++)
                      item.getItemById(
                          group.assetGroups[groupIndex].assetItems[itemIndex])
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
