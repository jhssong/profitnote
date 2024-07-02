import 'package:flutter/material.dart';
import 'package:profitnote/screens/add_screen.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/card_widget.dart';
import 'package:profitnote/widgets/control_btn.dart';
import 'package:profitnote/widgets/control_btn_group.dart';
import 'package:profitnote/widgets/input_widget.dart';
import 'package:profitnote/widgets/transaction_item_widget.dart';
import 'package:profitnote/widgets/type_selection_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profit Note"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddScreen(),
            ),
          );
        },
        foregroundColor: ColorTheme.cardLabelText,
        backgroundColor: ColorTheme.backgroundOfBackground,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWidget(
              title: "Title Text",
              onPressed: () {},
              body: const Text("Child Text"),
            ),
            CardWidget(
              title: "최근 결제 내역",
              onPressed: () {},
              body: Column(
                children: [
                  TransactionItemWidget(onPressed: () {}),
                  TransactionItemWidget(onPressed: () {}),
                  TransactionItemWidget(onPressed: () {}),
                ],
              ),
            ),
            const CardWidget(
              title: "Card Widget with no detail button",
              body: Text('body child'),
            ),
            ControlBtn(onPressed: () {}),
            TypeSelectionBtn(
              callback: (int type) {},
            ),
            InputWidget(
              inputLabel: "input label 2",
              callback: (value) {
                print("String Input: $value");
              },
            ),
            InputWidget(
              inputLabel: "input label 1",
              callback: (value) {
                print("Dialog Input: $value");
              },
              isUseDialog: true,
              dialogTitle: "Dialog Text",
              dialogBodyList: const ['Item 1', 'Item 2', 'Item 3'],
            ),
            const CardWidget(
              title: "Card Widget with no detail button",
              body: Text('body child'),
            ),
            ControlBtn(onPressed: () {}),
            TypeSelectionBtn(
              callback: (int type) {},
            ),
            InputWidget(
                inputLabel: "Input Label 1",
                callback: (value) {
                  print("String Input: $value");
                }),
            InputWidget(
              inputLabel: "Input Label 2",
              callback: (value) {
                print("Dialog Input: $value");
              },
              isUseDialog: true,
              dialogTitle: "Dialog Text",
              dialogBodyList: const ['Item 1', 'Item 2', 'Item 3'],
            ),
            ControlBtnGroup(
                leftString: 'leftString',
                rightString: 'rightString',
                leftCallback: () {},
                rightCallback: () {}),
          ],
        ),
      ),
    );
  }
}
