import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profitnote/screens/setting/detailed_budget_setting_screen.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/category_tile.dart';

class BudgetSettingScreen extends StatefulWidget {
  const BudgetSettingScreen({super.key});

  @override
  State<BudgetSettingScreen> createState() => _BudgetSettingScreenState();
}

class _BudgetSettingScreenState extends State<BudgetSettingScreen> {
  final _controller = TextEditingController();
  var f = NumberFormat('###,###,###,###');

  void _onTap(String title, List<String> bodyList, Function dialogCallback) {
    _showSelectionDialog(
      context,
      title: title,
      bodyList: bodyList,
      dialogCallback: dialogCallback,
    );
  }

  Future<void> _showSelectionDialog(
    BuildContext context, {
    required title,
    required bodyList,
    required dialogCallback,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorTheme.cardBackground,
          title: Center(child: Text('$title')),
          titleTextStyle: Theme.of(context).textTheme.titleMedium,
          contentTextStyle: Theme.of(context).textTheme.bodyMedium,
          content: Wrap(
            children: List.generate(bodyList.length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        dialogCallback(bodyList[index]);
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        foregroundColor: ColorTheme.pointText,
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                      child: Text("${bodyList[index]}"),
                    ),
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("예산 설정", style: TextStyle(color: ColorTheme.cardLabelText)),
        iconTheme: IconThemeData(
          color: ColorTheme.cardLabelText,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Add new CategoryTile
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                CategoryTile(
                  icon: Icons.money_rounded,
                  label: "2024.03",
                  spent: '${f.format(400000)}원',
                  onTapped: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const DetailedBudgetSettingScreen()));
                  },
                  onLongPressed: () {
                    _onTap("2024.03", ["수정", "삭제"], (value) {
                      setState(() => _controller.text = value);
                    });
                  },
                ),
                CategoryTile(
                  icon: Icons.money_rounded,
                  label: "2024.04",
                  spent: '${f.format(400000)}원',
                  onTapped: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const DetailedBudgetSettingScreen()));
                  },
                  onLongPressed: () {
                    _onTap("2024.04", ["수정", "삭제"], (value) {
                      setState(() => _controller.text = value);
                    });
                  },
                ),
                CategoryTile(
                  icon: Icons.money_rounded,
                  label: "2024.05",
                  spent: '${f.format(400000)}원',
                  onTapped: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const DetailedBudgetSettingScreen()));
                  },
                  onLongPressed: () {
                    _onTap("2024.05", ["수정", "삭제"], (value) {
                      setState(() => _controller.text = value);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
