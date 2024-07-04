import 'package:flutter/material.dart';
import 'package:profitnote/widgets/asset_screen/asset_add_modal.dart';
import 'package:profitnote/widgets/asset_screen/asset_card.dart';
import 'package:profitnote/widgets/control_btn_group.dart';

class AssetSettingScreen extends StatelessWidget {
  const AssetSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("자산 설정")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ControlBtnGroup(titleList: const [
              "자산 추가",
              "순서 변경"
            ], callbackList: [
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const AssetAddModal()),
                );
              },
              () {},
              () {}
            ]),
            const AssetCard(
              title: "현금",
              assetListInGroup: [
                {},
                {},
              ],
            ),
            const AssetCard(
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
