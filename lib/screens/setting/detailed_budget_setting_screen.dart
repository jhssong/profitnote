import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/screens/setting/widgets/category_tile.dart';
import 'package:intl/intl.dart';

class DetailedBudgetSettingScreen extends StatefulWidget {
  const DetailedBudgetSettingScreen({super.key});

  @override
  State<DetailedBudgetSettingScreen> createState() =>
      _DetailedBudgetSettingScreenState();
}

class _DetailedBudgetSettingScreenState
    extends State<DetailedBudgetSettingScreen> {
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
        title: Text("예산 상세", style: TextStyle(color: ColorTheme.cardLabelText)),
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
                  icon: Icons.holiday_village,
                  label: "주식",
                  spent: '${f.format(200000)}원',
                  onTapped: () {},
                  onLongPressed: () {
                    _onTap("주식", ["수정", "삭제"], (value) {
                      setState(() => _controller.text = value);
                    });
                  }),
              CategoryTile(
                  icon: Icons.home,
                  label: "생활",
                  spent: '${f.format(150000)}원',
                  onTapped: () {},
                  onLongPressed: () {
                    _onTap("생활", ["수정", "삭제"], (value) {
                      setState(() => _controller.text = value);
                    });
                  }),
              CategoryTile(
                icon: Icons.home,
                label: "고정",
                spent: '${f.format(50000)}원',
                onTapped: () {},
                onLongPressed: () {
                  _onTap("고정", ["수정", "삭제"], (value) {
                    setState(() => _controller.text = value);
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
