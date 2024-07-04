import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class ToggleButtonsWithSlidingBorder extends StatefulWidget {
  const ToggleButtonsWithSlidingBorder({super.key, required this.onPressed});
  final Function(int index) onPressed;

  @override
  _ToggleButtonsWithSlidingBorderState createState() =>
      _ToggleButtonsWithSlidingBorderState();
}

class _ToggleButtonsWithSlidingBorderState
    extends State<ToggleButtonsWithSlidingBorder> {
  int _selectedTypeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(children: [
              _buildToggleButton("수입", 0),
              _buildToggleButton("지출", 1),
            ]),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 150),
              left:
                  _selectedTypeIndex * (MediaQuery.of(context).size.width / 2),
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 2.0,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildToggleButton(String text, int index) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          widget.onPressed(index);
          _selectedTypeIndex = index;
        },
        style: TextButton.styleFrom(
          backgroundColor: ColorTheme.cardBackground,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
