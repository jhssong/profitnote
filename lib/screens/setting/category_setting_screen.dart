import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/screens/setting/widgets/category_item_widget.dart';
import 'package:profitnote/widgets/control_btn_group.dart';

class CategorySettingScreen extends StatefulWidget {
  const CategorySettingScreen({super.key});

  @override
  State<CategorySettingScreen> createState() => _CategorySettingScreenState();
}

class _CategorySettingScreenState extends State<CategorySettingScreen> {
  final List<ExpenseCategory> expenseCategories = [
    ExpenseCategory(
      category: '식비',
      items: [
        CategoryItem(description: '프랭크버거', amount: '10000원'),
        CategoryItem(description: '푸행쿠버거', amount: '10000원'),
        CategoryItem(description: '마마터치', amount: '10000원'),
      ],
    ),
    ExpenseCategory(
      category: '생활',
      items: [
        CategoryItem(description: '샴푸', amount: '5000원'),
        CategoryItem(description: '세제', amount: '3000원'),
      ],
    ),
    ExpenseCategory(
      category: '고정',
      items: [
        CategoryItem(description: '월세', amount: '500000원'),
        CategoryItem(description: '인터넷', amount: '30000원'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profit Note")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        foregroundColor: ColorTheme.cardLabelText,
        backgroundColor: ColorTheme.backgroundOfBackground,
        child: const Icon(Icons.add),
      ),
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ControlBtnGroup(
              titleList: const ["수입", "지출"],
              callbackList: [() {}, () {}],
            ),
            Expanded(
              child: CategoryList(
                expenseCategories: expenseCategories,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpenseCategory {
  final String category;
  final List<CategoryItem> items;

  ExpenseCategory({required this.category, required this.items});
}

class CategoryList extends StatelessWidget {
  final List<ExpenseCategory> expenseCategories;

  const CategoryList({super.key, required this.expenseCategories});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: expenseCategories.map((category) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 28,
                        right: 16,
                        top: 16,
                        bottom: 8,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          controller:
                              TextEditingController(text: category.category),
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.left,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 8,
                        top: 16,
                        bottom: 8,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
              },
              children: category.items.map((item) {
                return TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 46,
                        right: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextField(
                          controller:
                              TextEditingController(text: item.description),
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.left,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            const Divider(),
          ],
        );
      }).toList(),
    );
  }
}
