import 'package:flutter/material.dart';
import 'package:profitnote/widgets/control_btn.dart';
import 'package:profitnote/widgets/input_widget.dart';

class AssetAddModal extends StatefulWidget {
  const AssetAddModal({super.key});

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
              inputLabel: "내용",
              callback: (value) {},
              isHorizontal: true,
            ),
            InputWidget(
              inputLabel: "이름",
              callback: (value) {},
              isHorizontal: true,
            ),
            InputWidget(
              inputLabel: "단위",
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
