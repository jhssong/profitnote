import 'package:flutter/material.dart';
import 'package:profitnote/widgets/control_btn.dart';
import 'package:profitnote/widgets/input_widget.dart';

class CategoryAddWidget extends StatefulWidget {
  const CategoryAddWidget({super.key});

  // TODO Asset Model 완성 후, EditMode로 접근 시 inital value로 초기화하는 코드 추가

  @override
  State<CategoryAddWidget> createState() => _CategoryAddWidgetState();
}

class _CategoryAddWidgetState extends State<CategoryAddWidget> {
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
              inputLabel: "수입/지출",
              callback: (value) {},
              isHorizontal: true,
              isUseDialog: true,
              dialogTitle: "수입/지출 선택",
              dialogBodyList: const ["수입", "지출"],
            ),
            InputWidget(
              inputLabel: "대분류",
              callback: (value) {},
              isHorizontal: true,
            ),
            InputWidget(
              inputLabel: "소분류",
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
