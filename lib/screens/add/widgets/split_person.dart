import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class SplitPerson extends StatefulWidget {
  const SplitPerson({super.key});

  @override
  State<SplitPerson> createState() => _SplitPersonState();
}

class _SplitPersonState extends State<SplitPerson> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextField(
            controller: _nameController,
            // onChanged: (value) => widget.callback(value),
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorTheme.cardBackground,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: TextField(
            controller: _priceController,
            readOnly: true,
            // onTap: _onTap,
            // onChanged: (value) => widget.callback(value),
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorTheme.cardBackground,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {
            setState(() => _isChecked = !_isChecked);
          },
          icon: Icon(
              _isChecked ? Icons.check_box : Icons.check_box_outline_blank),
        ),
      ],
    );
  }
}
