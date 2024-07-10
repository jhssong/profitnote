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

  void _deleteGroup(int groupIndex) {
    setState(() {
      String group = _groups[groupIndex];
      _groups.removeAt(groupIndex);
      _items.remove(group);
    });
  }

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
              decoration: BoxDecoration(
                color: ColorTheme.cardBackground,
                border: Border(
                  bottom: BorderSide(width: 1.5, color: ColorTheme.stroke),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    title: Row(
                      children: [
                        const Icon(Icons.money),
                        const SizedBox(width: 8),
                        Text(_groups[groupIndex]),
                      ],
                    ),
                    titleTextStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ColorTheme.cardLabelText,
                            ),
                    iconColor: ColorTheme.cardLabelText,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, size: 20),
                      onPressed: () {
                        if (_items[_groups[groupIndex]]!.isEmpty) {
                          _deleteGroup(groupIndex);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 1000),
                              content: Text('Cannot delete group with items'),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  ReorderableListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    children: [
                      for (int index = 0;
                          index < _items[_groups[groupIndex]]!.length;
                          index += 1)
                        ListTile(
                          key: Key('item_${_groups[groupIndex]}_$index'),
                          title: Text(_items[_groups[groupIndex]]![index]),
                          titleTextStyle:
                              Theme.of(context).textTheme.bodyMedium,
                          iconColor: ColorTheme.cardLabelText,
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, size: 20),
                            onPressed: () {
                              _deleteItem(_groups[groupIndex], index);
                            },
                          ),
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
