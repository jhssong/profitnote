import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/category_item_widget.dart';
import 'package:profitnote/widgets/control_btn_group.dart';

class CategorySettingScreen extends StatefulWidget {
  const CategorySettingScreen({super.key});

  @override
  State<CategorySettingScreen> createState() => _CategorySettingScreenState();
}

class _CategorySettingScreenState extends State<CategorySettingScreen> {
  final items = [
    {'leftString': 'Item 1', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
    {'leftString': 'Item 2', 'rightString': '₩ 1000'},
  ];
  void _handlePressed(int index, String leftString) {
    print('Index: $index, Left String: $leftString');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profit Note"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        foregroundColor: ColorTheme.cardLabelText,
        backgroundColor: ColorTheme.backgroundOfBackground,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ControlBtnGroup(
            leftString: "완료",
            rightString: "취소",
            leftCallback: () {},
            rightCallback: () {},
          ),
          Expanded(
            child: CategoryItemsWidget(
              items: items,
              onPressed: _handlePressed,
            ),
          )
        ],
      ),
    );
  }
}
