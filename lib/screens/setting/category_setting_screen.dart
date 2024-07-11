import 'package:flutter/material.dart';
import 'package:profitnote/screens/setting/widgets/category_add_widget.dart';
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

  void _reorderCategories(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final ExpenseCategory movedCategory =
          expenseCategories.removeAt(oldIndex);
      expenseCategories.insert(newIndex, movedCategory);
    });
  }

  void _reorderItems(int categoryIndex, int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final CategoryItem movedItem =
          expenseCategories[categoryIndex].items.removeAt(oldIndex);
      expenseCategories[categoryIndex].items.insert(newIndex, movedItem);
    });
  }

  void _deleteCategory(int index) {
    setState(() {
      expenseCategories.removeAt(index);
    });
  }

  void _deleteItem(int categoryIndex, int itemIndex) {
    setState(() {
      expenseCategories[categoryIndex].items.removeAt(itemIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("분류 수정"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const CategoryAddWidget()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ControlBtnGroup(
            titleList: const ["수입", "지출"],
            callbackList: [() {}, () {}],
          ),
          Expanded(
            child: ReorderableListView(
              onReorder: _reorderCategories,
              children: [
                for (int categoryIndex = 0;
                    categoryIndex < expenseCategories.length;
                    categoryIndex += 1)
                  Container(
                    key: Key('category_$categoryIndex'),
                    decoration: BoxDecoration(
                      color: ColorTheme.cardBackground,
                      border: Border(
                        bottom:
                            BorderSide(width: 1.5, color: ColorTheme.stroke),
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: TextEditingController(
                                      text: expenseCategories[categoryIndex]
                                          .category),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  textAlign: TextAlign.left,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, size: 20),
                            onPressed: () {
                              if (expenseCategories[categoryIndex]
                                  .items
                                  .isEmpty) {
                                _deleteCategory(categoryIndex);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(milliseconds: 1000),
                                    content: Text(
                                        'Cannot delete category with items'),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        ReorderableListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          onReorder: (oldIndex, newIndex) =>
                              _reorderItems(categoryIndex, oldIndex, newIndex),
                          children: [
                            for (int itemIndex = 0;
                                itemIndex <
                                    expenseCategories[categoryIndex]
                                        .items
                                        .length;
                                itemIndex += 1)
                              ListTile(
                                key: Key('item_${categoryIndex}_$itemIndex'),
                                title: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                  child: TextField(
                                    controller: TextEditingController(
                                        text: expenseCategories[categoryIndex]
                                            .items[itemIndex]
                                            .description),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.left,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete, size: 20),
                                  onPressed: () {
                                    _deleteItem(categoryIndex, itemIndex);
                                  },
                                ),
                              ),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseCategory {
  final String category;
  final List<CategoryItem> items;

  ExpenseCategory({required this.category, required this.items});
}
