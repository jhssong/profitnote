import 'package:flutter/material.dart';
import 'package:profitnote/widgets/control_btn.dart';
import 'package:profitnote/widgets/input_widget.dart';

class AssetAddModal extends StatefulWidget {
  const AssetAddModal({super.key});

  // TODO Asset Model 완성 후, EditMode로 접근 시 inital value로 초기화하는 코드 추가

  @override
  State<AssetAddModal> createState() => _AssetAddModalState();
}

class _AssetAddModalState extends State<AssetAddModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자산 추가"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputWidget(
              inputLabel: "그룹",
              callback: (value) {},
              isHorizontal: true,
              isUseDialog: true,
              dialogTitle: "자산 그룹 선택",
              dialogBodyList: const ["현금", "카드"],
            ),
            InputWidget(
              inputLabel: "이름",
              callback: (value) {},
              isHorizontal: true,
            ),
            InputWidget(
              inputLabel: "잔액",
              callback: (value) {},
              isHorizontal: true,
            ),
            // InputWidget(
            //   inputLabel: "연결",
            //   callback: (value) {},
            //   isHorizontal: true,
            // ),
            InputWidget(
              inputLabel: "메모",
              callback: (value) {},
              isHorizontal: true,
            ),
            ControlBtn(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
