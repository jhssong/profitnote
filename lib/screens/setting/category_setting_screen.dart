import 'package:flutter/material.dart';
import 'package:profitnote/provider/category_provider.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/screens/setting/widgets/category_add_widget.dart';
import 'package:provider/provider.dart';

class CategorySettingScreen extends StatefulWidget {
  const CategorySettingScreen({super.key});

  @override
  State<CategorySettingScreen> createState() => _CategorySettingScreenState();
}

class _CategorySettingScreenState extends State<CategorySettingScreen>
    with SingleTickerProviderStateMixin {
  List<MainCategory> _expenseCategories = [];
  void _reorderCategories(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final movedCategory = _expenseCategories.removeAt(oldIndex);
      _expenseCategories.insert(newIndex, movedCategory);
    });
  }

  void _reorderItems(int categoryIndex, int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final movedItem =
          _expenseCategories[categoryIndex].subCategories.removeAt(oldIndex);
      _expenseCategories[categoryIndex]
          .subCategories
          .insert(newIndex, movedItem);
    });
  }

  void _deleteCategory(int index) {
    setState(() {
      _expenseCategories.removeAt(index);
    });
  }

  void _deleteItem(int categoryIndex, int itemIndex) {
    setState(() {
      _expenseCategories[categoryIndex].subCategories.removeAt(itemIndex);
    });
  }

  final List<Widget> _tabs = [
    const Tab(text: "수입"),
    const Tab(text: "지출"),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _readCategories();
    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> _readCategories() async {
    final provider = Provider.of<CategoryProvider>(context, listen: false);
    provider.initializeCategories();
    _expenseCategories = await provider.readCategories();
    setState(() {
      _expenseCategories = _expenseCategories;
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
          Container(
            color: ColorTheme.cardBackground,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: ColorTheme.cardLabelText, width: 2),
                ),
              ),
              child: TabBar(
                tabs: _tabs,
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
                  categories: _expenseCategories,
                  onReorderCategories: _reorderCategories,
                  onReorderItems: _reorderItems,
                  deleteCategory: _deleteCategory,
                  deleteItem: _deleteItem,
                ),
                CategoryListWidget(
                  categories: _expenseCategories,
                  onReorderCategories: _reorderCategories,
                  onReorderItems: _reorderItems,
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

class CategoryItem {
  final String description;
  final String amount;

  CategoryItem({required this.description, required this.amount});
}

class CategoryListWidget extends StatelessWidget {
  final List<MainCategory> categories;
  final Function(int oldIndex, int newIndex) onReorderCategories;
  final Function(int categoryIndex, int oldIndex, int newIndex) onReorderItems;
  final Function(int categoryIndex) deleteCategory;
  final Function(int categoryIndex, int itemIndex) deleteItem;

  const CategoryListWidget({
    super.key,
    required this.categories,
    required this.onReorderCategories,
    required this.onReorderItems,
    required this.deleteCategory,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: onReorderCategories,
      children: [
        for (int categoryIndex = 0;
            categoryIndex < categories.length;
            categoryIndex++)
          Container(
            key: Key('category_$categoryIndex'),
            padding: const EdgeInsets.all(16),
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
                CategoryCard(
                  category: categories[categoryIndex].name,
                  deleteCategory: () {
                    if (categories[categoryIndex].name.isEmpty) {
                      deleteCategory(categoryIndex);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 1000),
                          content: Text('Cannot delete category with items'),
                        ),
                      );
                    }
                  },
                ),
                // ReorderableListView(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   onReorder: (int oldIndex, int newIndex) {
                //     onReorderItems(categoryIndex, oldIndex, newIndex);
                //   },
                //   children: [
                //     for (int itemIndex = 0;
                //         itemIndex <
                //             categories[categoryIndex].subCategories.length;
                //         itemIndex++)
                //       CategoryItemCard(
                //         key: Key('item_${categoryIndex}_$itemIndex'),
                //         description: categories[categoryIndex].subCategories,
                //         amount: categories[categoryIndex]
                //             .subCategories[itemIndex]
                //             .amount,
                //         deleteItem: () => deleteItem(categoryIndex, itemIndex),
                //       ),
                //   ],
                // ),
              ],
            ),
          ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  final VoidCallback deleteCategory;

  const CategoryCard({
    super.key,
    required this.category,
    required this.deleteCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: ColorTheme.cardBackground,
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 8,
              ),
              alignment: Alignment.centerLeft,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            child: Text(
              category,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: ColorTheme.cardLabelText),
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                icon: const Icon(Icons.delete, size: 20),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                icon: const Icon(Icons.drag_indicator, size: 20),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CategoryItemCard extends StatelessWidget {
  final String description;
  final String amount;
  final VoidCallback deleteItem;

  const CategoryItemCard({
    super.key,
    required this.description,
    required this.amount,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: ColorTheme.cardBackground,
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 8,
              ),
              alignment: Alignment.centerLeft,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                icon: const Icon(Icons.delete, size: 20),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                icon: const Icon(Icons.drag_indicator, size: 20),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
