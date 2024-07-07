import 'package:flutter/material.dart';
import 'package:profitnote/screens/asset_setting_screen.dart';
import 'package:profitnote/widgets/asset_card.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자산"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const AssetSettingScreen()),
              );
            },
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AssetCard(
              title: "현금",
              assetListInGroup: [
                {},
                {},
              ],
            ),
            AssetCard(
              title: "카드",
              assetListInGroup: [
                {},
                {},
              ],
            ),
          ],
        ),
      ),
    );
  }
}
