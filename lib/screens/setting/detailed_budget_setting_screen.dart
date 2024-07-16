import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    "소분류1": 200000,
    "소분류2": 150000,
    "소분류3": 50000,
    "소분류4": 200000,
    "소분류5": 150000,
    "소분류6": 50000,
    "소분류7": 200000,
    "소분류8": 150000,
    "소분류9": 50000,
  };

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
        title: const Text("예산 상세"),
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
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: <Widget>[
              ExpansionTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  leading: const Icon(Icons.money_rounded),
                  iconColor: ColorTheme.cardText,
                  collapsedIconColor: ColorTheme.cardLabelText,
                  backgroundColor: ColorTheme.backgroundOfBackground,
                  collapsedBackgroundColor: ColorTheme.cardBackground,
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("대분류1",
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text("0원",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ]),
                  children: <Widget>[
                    CategoryTile(
                      icon: Icons.holiday_village,
                      label: "소분류1",
                      spent: '${f.format(_detailedBudgets["소분류1"]!)}원',
                      onTapped: () {
                        _moneyInput("소분류1", (value) {
                          setState(() {
                            _detailedBudgets["소분류1"] = int.parse(value);
                          });
                        });
                      },
                    ),
                    CategoryTile(
                      icon: Icons.home,
                      label: "소분류2",
                      spent: '${f.format(_detailedBudgets["소분류2"]!)}원',
                      onTapped: () {
                        _moneyInput("소분류2", (value) {
                          setState(() {
                            _detailedBudgets["소분류2"] = int.parse(value);
                          });
                        });
                      },
                    ),
                    CategoryTile(
                      icon: Icons.home,
                      label: "소분류3",
                      spent: '${f.format(_detailedBudgets["소분류3"]!)}원',
                      onTapped: () {
                        _moneyInput("소분류3", (value) {
                          setState(() {
                            _detailedBudgets["소분류3"] = int.parse(value);
                          });
                        });
                      },
                    ),
                  ]),
              ExpansionTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  leading: const Icon(Icons.money_rounded),
                  iconColor: ColorTheme.cardText,
                  collapsedIconColor: ColorTheme.cardLabelText,
                  backgroundColor: ColorTheme.backgroundOfBackground,
                  collapsedBackgroundColor: ColorTheme.cardBackground,
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("대분류2",
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text("0원",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ]),
                  children: <Widget>[
                    CategoryTile(
                      icon: Icons.holiday_village,
                      label: "소분류4",
                      spent: '${f.format(_detailedBudgets["소분류4"]!)}원',
                      onTapped: () {
                        _moneyInput("소분류4", (value) {
                          setState(() {
                            _detailedBudgets["소분류4"] = int.parse(value);
                          });
                        });
                      },
                    ),
                    CategoryTile(
                      icon: Icons.home,
                      label: "소분류5",
                      spent: '${f.format(_detailedBudgets["소분류5"]!)}원',
                      onTapped: () {
                        _moneyInput("소분류5", (value) {
                          setState(() {
                            _detailedBudgets["소분류5"] = int.parse(value);
                          });
                        });
                      },
                    ),
                    CategoryTile(
                      icon: Icons.home,
                      label: "소분류6",
                      spent: '${f.format(_detailedBudgets["소분류6"]!)}원',
                      onTapped: () {
                        _moneyInput("소분류6", (value) {
                          setState(() {
                            _detailedBudgets["소분류6"] = int.parse(value);
                          });
                        });
                      },
                    ),
                  ]),
              ExpansionTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  leading: const Icon(Icons.money_rounded),
                  iconColor: ColorTheme.cardText,
                  collapsedIconColor: ColorTheme.cardLabelText,
                  backgroundColor: ColorTheme.backgroundOfBackground,
                  collapsedBackgroundColor: ColorTheme.cardBackground,
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("대분류3",
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text("0원",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ]),
                  children: <Widget>[
                    CategoryTile(
                      icon: Icons.holiday_village,
                      label: "소분류7",
                      spent: '${f.format(_detailedBudgets["소분류7"]!)}원',
                      onTapped: () {
                        _moneyInput("소분류7", (value) {
                          setState(() {
                            _detailedBudgets["소분류7"] = int.parse(value);
                          });
                        });
                      },
                    ),
                    CategoryTile(
                      icon: Icons.home,
                      label: "소분류8",
                      spent: '${f.format(_detailedBudgets["소분류8"]!)}원',
                      onTapped: () {
                        _moneyInput("소분류8", (value) {
                          setState(() {
                            _detailedBudgets["소분류8"] = int.parse(value);
                          });
                        });
                      },
                    ),
                    CategoryTile(
                      icon: Icons.home,
                      label: "소분류9",
                      spent: '${f.format(_detailedBudgets["소분류9"]!)}원',
                      onTapped: () {
                        _moneyInput("소분류9", (value) {
                          setState(() {
                            _detailedBudgets["소분류9"] = int.parse(value);
                          });
                        });
                      },
                    ),
                  ]),
            ],
          ))
        ],
      ),
    );
  }
}
