import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/control_btn.dart';
import 'package:profitnote/widgets/control_btn_group.dart';

class CategoryAddWidget extends StatefulWidget {
  const CategoryAddWidget({super.key});

  @override
  State<CategoryAddWidget> createState() => _CategoryAddWidgetState();
}

class _CategoryAddWidgetState extends State<CategoryAddWidget> {
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
            ControlBtnGroup(
              titleList: const ['수입', '지출'],
              callbackList: [() {}, () {}],
            ),
            CustomDropdownWidget(
              labelText: '대분류',
              items: const ["야", "호"],
              onChanged: (String? val) {},
              onPressedAdd: (String? val) {},
            ),
            CustomDropdownWidget(
              labelText: '소분류',
              items: const ["야", "호"],
              onChanged: (String? val) {},
              onPressedAdd: (String? val) {},
            ),
            ControlBtn(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class CustomDropdownWidget extends StatelessWidget {
  const CustomDropdownWidget(
      {super.key,
      required this.labelText,
      required this.items,
      required this.onChanged,
      required this.onPressedAdd});
  final String labelText;
  final List<String> items;
  final Function(String?) onChanged;
  final Function(String?) onPressedAdd;

  @override
  Widget build(BuildContext context) {
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
                  onChanged: onChanged,
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
