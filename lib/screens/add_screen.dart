import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          TypeSelectionBtn(
            callback: (int type) {},
          ),
          InputWidget(inputLabel: "내용", callback: (value) {}),
          InputWidget(inputLabel: "금액", callback: (value) {}),
          InputWidget(inputLabel: "분류", callback: (value) {}),
          InputWidget(inputLabel: "자산", callback: (value) {}),
          InputWidget(inputLabel: "날짜", callback: (value) {}),
          InputWidget(inputLabel: "메모", callback: (value) {}),
          ControlBtn(onPressed: () {}),
        ],
      ),
    );
  }
}
