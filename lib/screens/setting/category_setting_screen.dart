import 'package:flutter/material.dart';
import 'package:profitnote/models/main_category_model.dart';
import 'package:profitnote/models/sub_category_model.dart';
import 'package:profitnote/providers/main_category_provider.dart';
import 'package:profitnote/providers/sub_category_provider.dart';
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
  final List<Widget> _tabs = [const Tab(text: "수입"), const Tab(text: "지출")];

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
        titleSpacing: 0,
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
            child: Consumer2<MainCategoryProvider, SubCategoryProvider>(
              builder: (context, main, sub, child) {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    CategoryListWidget(
                      categories: main.expenseCategories,
                      subCategories: sub.subCategories,
                      onReorderCategories: main.reorderCategories,
                      onReorderItems: main.reorderItems,
                      deleteCategory: main.deleteCategory,
                      deleteItem: main.deleteItem,
                    ),
                    CategoryListWidget(
                      categories: main.incomeCategories,
                      subCategories: sub.subCategories,
                      onReorderCategories: main.reorderCategories,
                      onReorderItems: main.reorderItems,
                      deleteCategory: main.deleteCategory,
                      deleteItem: main.deleteItem,
                    ),
                  ],
                );
              },
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
  final List<MainCategoryModel> categories;
  final List<SubCategoryModel> subCategories;
  final Function(int oldIndex, int newIndex) onReorderCategories;
  final Function(int categoryIndex, int oldIndex, int newIndex) onReorderItems;
  final Function(int categoryIndex) deleteCategory;
  final Function(int categoryIndex, int itemIndex) deleteItem;

  const CategoryListWidget({
    super.key,
    required this.categories,
    required this.subCategories,
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
                ReorderableListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  onReorder: (int oldIndex, int newIndex) {
                    onReorderItems(categoryIndex, oldIndex, newIndex);
                  },
                  children: [
                    for (int itemIndex
                        in categories[categoryIndex].subCategories)
                      CategoryItemCard(
                        key: Key('item_${categoryIndex}_$itemIndex'),
                        description: _getSubCategoryById(itemIndex).name,
                        amount:
                            _getSubCategoryById(itemIndex).amount.toString(),
                        deleteItem: () => deleteItem(categoryIndex, itemIndex),
                      ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }

  SubCategoryModel _getSubCategoryById(int id) {
    return subCategories.firstWhere((subCategory) => subCategory.id == id);
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
