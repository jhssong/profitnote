import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/control_btn.dart';

class CategoryAddWidget extends StatefulWidget {
  const CategoryAddWidget({super.key});

  @override
  State<CategoryAddWidget> createState() => _CategoryAddWidgetState();
}

class _CategoryAddWidgetState extends State<CategoryAddWidget> {
  var titleList = ['수입', '지출'];
  var selectedColors = [ColorTheme.incomeColor, ColorTheme.expenseColor];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("카테고리 추가"),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorTheme.cardBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int index = 0; index < titleList.length; index++) ...[
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          foregroundColor: selectedIndex == index
                              ? selectedColors[index]
                              : ColorTheme.pointText,
                          textStyle: Theme.of(context).textTheme.titleMedium,
                        ),
                        child: Text(titleList[index]),
                      ),
                    ),
                    if (index < titleList.length - 1)
                      Container(width: 2, height: 32, color: ColorTheme.stroke),
                  ],
                ],
              ),
            ),
            _buildDropdownWidget(
              labelText: '대분류',
              items: const ["야", "호"],
            ),
            _buildDropdownWidget(
              labelText: '소분류',
              items: const ["야", "호"],
            ),
            ControlBtn(onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownWidget(
      {required String labelText, required List<String> items}) {
    String? selectedItem;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            labelText,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ColorTheme.cardLabelText),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedItem,
                  icon: Icon(Icons.arrow_drop_down,
                      color: Theme.of(context).iconTheme.color),
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: ColorTheme.pointText,
                            ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedItem = newValue!;
                    });
                  },
                  style: TextStyle(
                    color: ColorTheme.pointText,
                    fontSize: 16,
                  ),
                  dropdownColor: ColorTheme.background,
                ),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
