import 'package:flutter/material.dart';
import 'package:profitnote/constants/constants.dart';
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
                      main: main,
                      sub: sub,
                      categories: main.expenseCategories,
                      sharedPrefKey: Keys.expenseCategoryKey,
                    ),
                    CategoryListWidget(
                      main: main,
                      sub: sub,
                      categories: main.incomeCategories,
                      sharedPrefKey: Keys.incomeCategoryKey,
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

class CategoryListWidget extends StatelessWidget {
  final MainCategoryProvider main;
  final SubCategoryProvider sub;
  final List<MainCategoryModel> categories;
  final SharedPrefKey sharedPrefKey;

  const CategoryListWidget(
      {super.key,
      required this.main,
      required this.sub,
      required this.categories,
      required this.sharedPrefKey});

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        main.reorderCategories(sharedPrefKey, oldIndex, newIndex);
      },
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
                  category: categories[categoryIndex],
                  updateCategory: main.updateCategory,
                  deleteCategory: () {
                    if (categories[categoryIndex].subCategories.isEmpty) {
                      main.deleteCategory(sharedPrefKey, categoryIndex);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 1000),
                          content: Text('Cannot delete category with items'),
                        ),
                      );
                    }
                  },
                  sharedPrefKey: sharedPrefKey,
                  categoryIndex: categoryIndex,
                ),
                ReorderableListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  onReorder: (int oldIndex, int newIndex) {
                    main.reorderItems(
                        sharedPrefKey, categoryIndex, oldIndex, newIndex);
                  },
                  children: [
                    for (int itemIndex
                        in categories[categoryIndex].subCategories)
                      CategoryItemCard(
                        key: Key('item_${categoryIndex}_$itemIndex'),
                        category: sub.getSubCategoryById(itemIndex),
                        itemIndex: itemIndex,
                        updateItem: sub.updateItem,
                        deleteItem: () {
                          main.deleteItem(
                              sharedPrefKey, categoryIndex, itemIndex);
                          sub.deleteItem(itemIndex);
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final MainCategoryModel category;
  final Function(
          SharedPrefKey key, int categoryIndex, MainCategoryModel category)
      updateCategory;
  final SharedPrefKey sharedPrefKey;
  final int categoryIndex;
  final VoidCallback deleteCategory;

  const CategoryCard({
    super.key,
    required this.category,
    required this.sharedPrefKey,
    required this.categoryIndex,
    required this.updateCategory,
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String newName = category.name;
                  return AlertDialog(
                    title: Text('분류 수정',
                        style: Theme.of(context).textTheme.titleMedium),
                    backgroundColor: ColorTheme.cardBackground,
                    content: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          hintText: '분류 이름을 입력하세요',
                          hintStyle: Theme.of(context).textTheme.labelMedium),
                      onChanged: (value) {
                        newName = value;
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('취소',
                            style: Theme.of(context).textTheme.titleMedium),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('저장',
                            style: Theme.of(context).textTheme.titleMedium),
                        onPressed: () {
                          MainCategoryModel updatedCategory = MainCategoryModel(
                            id: category.id,
                            name: newName,
                            type: category.type,
                            subCategories: category.subCategories,
                            isVisible: category.isVisible,
                          );
                          updateCategory(
                              sharedPrefKey, categoryIndex, updatedCategory);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              category.name,
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
                onPressed: deleteCategory,
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
  final SubCategoryModel category;
  final int itemIndex;
  final VoidCallback deleteItem;
  final Function(int index, SubCategoryModel newItem) updateItem;

  const CategoryItemCard({
    super.key,
    required this.category,
    required this.itemIndex,
    required this.deleteItem,
    required this.updateItem,
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String newName = category.name;
                  return AlertDialog(
                    title: Text('분류 수정',
                        style: Theme.of(context).textTheme.titleMedium),
                    backgroundColor: ColorTheme.cardBackground,
                    content: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          hintText: '분류 이름을 입력하세요',
                          hintStyle: Theme.of(context).textTheme.labelMedium),
                      onChanged: (value) {
                        newName = value;
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('취소',
                            style: Theme.of(context).textTheme.titleMedium),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('저장',
                            style: Theme.of(context).textTheme.titleMedium),
                        onPressed: () {
                          SubCategoryModel updatedCategory = SubCategoryModel(
                            id: category.id,
                            name: newName,
                            isVisible: category.isVisible,
                          );
                          updateItem(itemIndex, updatedCategory);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              category.name,
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
                onPressed: deleteItem,
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
