import 'package:flutter/material.dart';
import 'package:profitnote/screens/add/split_screen.dart';
import 'package:profitnote/utils/show_date_picker_dialog.dart';
import 'package:profitnote/utils/show_time_picker_dialog.dart';
import 'package:profitnote/widgets/control_btn.dart';
import 'package:profitnote/widgets/input_widget.dart';
import 'package:profitnote/screens/add/widgets/type_selection_btn.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SplitScreen()),
              );
            },
            icon: const Icon(Icons.people),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TypeSelectionBtn(
              callback: (int type) {},
            ),
            InputWidget(inputLabel: "내용", callback: (value) {}),
            Row(
              children: [
                Expanded(
                  child: InputWidget(
                    inputLabel: "대분류",
                    callback: (value) {},
                    isUseDialog: true,
                    dialogTitle: "대분류 선택",
                    dialogBodyList: const ["주식", "생활", "고정"],
                  ),
                ),
                Expanded(
                  child: InputWidget(
                    inputLabel: "소분류",
                    callback: (value) {},
                    isUseDialog: true,
                    dialogTitle: "소분류 선택",
                    dialogBodyList: const ["소분류1", "소분류2", "소분류3"],
                  ),
                ),
              ],
            ),
            InputWidget(
              inputLabel: "자산",
              callback: (value) {},
              isUseDialog: true,
              dialogTitle: "자산 선택",
              dialogBodyList: const ["토스카드", "현대카드", "국민카드"],
            ),
            InputWidget(
              inputLabel: "금액",
              callback: (value) {},
            ),
            Row(
              children: [
                Expanded(
                  child: InputWidget(
                    inputLabel: "날짜",
                    callback: (value) {},
                    isUseDialog: true,
                    showCustomDialog: showDatePickerDialog,
                  ),
                ),
                Expanded(
                  child: InputWidget(
                    inputLabel: "시간",
                    callback: (value) {},
                    isUseDialog: true,
                    showCustomDialog: showTimePickerDialog,
                  ),
                ),
              ],
            ),
            InputWidget(inputLabel: "메모", callback: (value) {}),
            ControlBtn(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
