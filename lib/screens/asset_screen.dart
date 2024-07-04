import 'package:flutter/material.dart';
import 'package:profitnote/widgets/asset_screen/asset_card.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("자산")),
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
