import 'package:flutter/material.dart';
import 'package:profitnote/utils/showDatePickerDialog.dart';
import 'package:profitnote/widgets/control_btn.dart';
import 'package:profitnote/widgets/input_widget.dart';
import 'package:profitnote/widgets/type_selection_btn.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("내역 추가"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TypeSelectionBtn(
              callback: (int type) {},
            ),
            InputWidget(inputLabel: "내용", callback: (value) {}),
            InputWidget(
              inputLabel: "금액",
              callback: (value) {},
              // isUseDialog: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(children: [
                Text("분류", style: Theme.of(context).textTheme.titleSmall)
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  InputWidget(
                    inputLabel: "대분류",
                    callback: (value) {},
                    isUseDialog: true,
                    dialogTitle: "대분류 선택",
                    dialogBodyList: const ["주식", "생활", "고정"],
                    isHorizontal: true,
                  ),
                  InputWidget(
                    inputLabel: "소분류",
                    callback: (value) {},
                    isUseDialog: true,
                    dialogTitle: "소분류 선택",
                    dialogBodyList: const ["소분류1", "소분류2", "소분류3"],
                    isHorizontal: true,
                  ),
                ],
              ),
            ),
            InputWidget(
              inputLabel: "자산",
              callback: (value) {},
              isUseDialog: true,
              dialogTitle: "자산 선택",
              dialogBodyList: const ["토스카드", "현대카드", "국민카드"],
            ),
            InputWidget(
              inputLabel: "날짜",
              callback: (value) {},
              isUseDialog: true,
              showCustomDialog: showDatePickerDialog,
            ),
            InputWidget(inputLabel: "메모", callback: (value) {}),
            ControlBtn(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
