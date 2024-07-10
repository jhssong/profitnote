import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/category_tile.dart';

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
  final Map<String, int> _detailedBudgets = {
    "주식": 200000,
    "생활": 150000,
    "고정": 50000,
  };

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
    required String title,
    required List<String> bodyList,
    required Function dialogCallback,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorTheme.cardBackground,
          title: Center(child: Text(title)),
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
                      child: Text(bodyList[index]),
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

  Future<void> _moneyInput(String title, Function dialogCallback) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: ColorTheme.cardBackground,
            title: Center(child: Text(title)),
            titleTextStyle: Theme.of(context).textTheme.titleMedium,
            contentTextStyle: Theme.of(context).textTheme.bodyMedium,
            content: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: _controller,
              decoration: InputDecoration(
                hintText: "금액을 입력하세요",
                hintStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    Text("취소", style: Theme.of(context).textTheme.bodyMedium),
              ),
              TextButton(
                onPressed: () {
                  dialogCallback(_controller.text);
                  Navigator.of(context).pop();
                },
                child:
                    Text("확인", style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    int sum;
    return Scaffold(
      appBar: AppBar(
        title: Text("예산 상세", style: TextStyle(color: ColorTheme.cardLabelText)),
        iconTheme: IconThemeData(
          color: ColorTheme.cardLabelText,
        ),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            sum = 0;
            _detailedBudgets.forEach((key, value) {
              sum += value;
            });
            Navigator.pop(context, sum);
          },
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
                  spent: '${f.format(_detailedBudgets["주식"]!)}원',
                  onTapped: () {
                    _moneyInput("주식", (value) {
                      setState(() {
                        _detailedBudgets["주식"] = int.parse(value);
                      });
                    });
                  },
                  onLongPressed: () {
                    _onTap("주식", ["수정", "삭제"], (value) {
                      setState(() => _controller.text = value);
                    });
                  }),
              CategoryTile(
                  icon: Icons.home,
                  label: "생활",
                  spent: '${f.format(_detailedBudgets["생활"]!)}원',
                  onTapped: () {
                    _moneyInput("생활", (value) {
                      setState(() {
                        _detailedBudgets["생활"] = int.parse(value);
                      });
                    });
                  },
                  onLongPressed: () {
                    _onTap("생활", ["수정", "삭제"], (value) {
                      setState(() => _controller.text = value);
                    });
                  }),
              CategoryTile(
                icon: Icons.home,
                label: "고정",
                spent: '${f.format(_detailedBudgets["고정"]!)}원',
                onTapped: () {
                  _moneyInput("고정", (value) {
                    setState(() {
                      _detailedBudgets["고정"] = int.parse(value);
                    });
                  });
                },
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
