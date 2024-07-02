import 'package:flutter/material.dart';
import 'package:profitnote/widgets/control_btn.dart';
import 'package:profitnote/widgets/input_widget.dart';
import 'package:profitnote/widgets/split_person.dart';

class SplitScreen extends StatefulWidget {
  const SplitScreen({super.key});

  @override
  State<SplitScreen> createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("정산"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputWidget(
              inputLabel: "자산",
              callback: (value) {},
              isUseDialog: true,
              dialogTitle: "자산 선택",
              dialogBodyList: const ["토스카드", "현대카드", "국민카드"],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("인원", style: Theme.of(context).textTheme.titleSmall),
                    Text(
                      "0 / 3 완료",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  SplitPerson(),
                  SizedBox(height: 16),
                  SplitPerson(),
                  SizedBox(height: 16),
                  SplitPerson(),
                  SizedBox(height: 16),
                ],
              ),
            ),
            ControlBtn(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
