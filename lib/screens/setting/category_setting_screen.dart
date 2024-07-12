import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:profitnote/screens/setting/widgets/category_add_widget.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/screens/setting/widgets/category_item_widget.dart';

class CategorySettingScreen extends StatefulWidget {
  const CategorySettingScreen({super.key});

  @override
  State<CategorySettingScreen> createState() => _CategorySettingScreenState();
}

class _CategorySettingScreenState extends State<CategorySettingScreen>
    with SingleTickerProviderStateMixin {
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

  final List<Widget> tabs = [
    const Tab(text: "수입"),
    const Tab(text: "지출"),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
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
          Container(
            color: ColorTheme.cardBackground,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: ColorTheme.cardLabelText, width: 2),
                ),
              ),
              child: TabBar(
                tabs: tabs,
                labelStyle: Theme.of(context).textTheme.titleMedium,
                controller: _tabController,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2,
                    color: ColorTheme.expenseColor,
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: ColorTheme.cardText,
                unselectedLabelColor: ColorTheme.cardLabelText,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CategoryListWidget(
                  categories: expenseCategories,
                  onReorderCategories: _reorderCategories,
                  deleteCategory: _deleteCategory,
                  deleteItem: _deleteItem,
                ),
                CategoryListWidget(
                  categories: expenseCategories,
                  onReorderCategories: _reorderCategories,
                  deleteCategory: _deleteCategory,
                  deleteItem: _deleteItem,
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

class CategoryListWidget extends StatelessWidget {
  final List<ExpenseCategory> categories;
  final Function(int oldIndex, int newIndex) onReorderCategories;
  final Function(int categoryIndex) deleteCategory;
  final Function(int categoryIndex, int itemIndex) deleteItem;

  const CategoryListWidget({
    super.key,
    required this.categories,
    required this.onReorderCategories,
    required this.deleteCategory,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ReorderableListView(
            onReorder: onReorderCategories,
            children: [
              for (int categoryIndex = 0;
                  categoryIndex < categories.length;
                  categoryIndex++)
                Container(
                  padding: const EdgeInsets.all(16),
                  key: Key('category_$categoryIndex'),
                  decoration: BoxDecoration(
                    color: ColorTheme.cardBackground,
                    border: Border(
                      bottom: BorderSide(
                        width: 1.5,
                        color: Theme.of(context).dividerColor,
                      ),
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
                                  text: categories[categoryIndex].category,
                                ),
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.left,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, size: 20),
                          onPressed: () {
                            if (categories[categoryIndex].items.isEmpty) {
                              deleteCategory(categoryIndex);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(milliseconds: 1000),
                                  content:
                                      Text('Cannot delete category with items'),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      ReorderableListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          for (int itemIndex = 0;
                              itemIndex <
                                  categories[categoryIndex].items.length;
                              itemIndex++)
                            ListTile(
                              key: Key('item_${categoryIndex}_$itemIndex'),
                              title: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: TextField(
                                  controller: TextEditingController(
                                    text: categories[categoryIndex]
                                        .items[itemIndex]
                                        .description,
                                  ),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.left,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, size: 20),
                                onPressed: () {
                                  deleteItem(categoryIndex, itemIndex);
                                },
                              ),
                            ),
                        ],
                        onReorder: (int oldIndex, int newIndex) {},
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
