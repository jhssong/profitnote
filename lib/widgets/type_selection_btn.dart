import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class TypeSelectionBtn extends StatefulWidget {
  const TypeSelectionBtn({super.key, required this.callback});

  final Function(int) callback;

  @override
  State<TypeSelectionBtn> createState() => _TypeSelectionBtnState();
}

class _TypeSelectionBtnState extends State<TypeSelectionBtn> {
  final List<bool> _selectedType = [true, false, false];
  final List<String> _typeList = ["수입", "지출", "이체"];

  void _updateSelection(int index) {
    setState(() {
      for (int i = 0; i < _selectedType.length; i++) {
        _selectedType[i] = i == index;
      }
    });
    widget.callback(index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          for (int index = 0; index < _typeList.length; index++) ...[
            Expanded(
                child: TextButton(
              onPressed: () => _updateSelection(index),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                foregroundColor: ColorTheme.pointText,
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              child: Text(
                _typeList[index],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )),
            if (index != _typeList.length - 1) const SizedBox(width: 8),
          ]
        ],
      ),
    );
  }
}
