import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/screens/setting/widgets/asset_add_modal.dart';

class AssetSettingScreen extends StatefulWidget {
  const AssetSettingScreen({super.key});

  @override
  State<AssetSettingScreen> createState() => _AssetSettingScreenState();
}

class _AssetSettingScreenState extends State<AssetSettingScreen> {
  final List<String> _groups = ["현금", "카드"];
  final Map<String, List<String>> _items = {
    "현금": List<String>.generate(3, (int index) => 'Item $index'),
    "카드": List<String>.generate(2, (int index) => 'Item $index'),
  };

  void _deleteItem(String group, int itemIndex) {
    setState(() {
      _items[group]?.removeAt(itemIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자산 설정"),
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AssetAddModal()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final String group = _groups.removeAt(oldIndex);
            _groups.insert(newIndex, group);
          });
        },
        children: [
          for (int groupIndex = 0; groupIndex < _groups.length; groupIndex += 1)
            Container(
              key: Key('group_$groupIndex'),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorTheme.cardBackground,
                border: Border(
                  bottom: BorderSide(width: 1.5, color: ColorTheme.stroke),
                ),
              ),
              child: Column(
                children: [
                  AssetGroupCard(title: _groups[groupIndex]),
                  ReorderableListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      for (int index = 0;
                          index < _items[_groups[groupIndex]]!.length;
                          index += 1)
                        AssetItemCard(
                          key: Key('item_$index'),
                          onPressed: () {
                            _deleteItem(_groups[groupIndex], index);
                          },
                        ),
                    ],
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final String item =
                            _items[_groups[groupIndex]]!.removeAt(oldIndex);
                        _items[_groups[groupIndex]]!.insert(newIndex, item);
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

class AssetGroupCard extends StatelessWidget {
  const AssetGroupCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.cardBackground,
      ),
      child: Row(
        children: [
          const Icon(Icons.money),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorTheme.cardLabelText),
          ),
        ],
      ),
    );
  }
}

class AssetItemCard extends StatelessWidget {
  const AssetItemCard({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
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
                  "KRW",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: IconButton(
                icon: const Icon(Icons.delete, size: 20),
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
