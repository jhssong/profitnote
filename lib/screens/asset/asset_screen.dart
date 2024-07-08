import 'package:flutter/material.dart';
import 'package:profitnote/screens/asset/widgets/asset_card.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({super.key});

  // TODO Asset Model 완성 후 특정 자산 클릭 시 해당 자산의 결재 내역을 보여주는 modal로 이동하는 기능 추가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자산"),
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
