import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class ControlBtnGroup extends StatelessWidget {
  const ControlBtnGroup({
    super.key,
    required this.leftString,
    required this.rightString,
    required this.leftCallback,
    required this.rightCallback,
  });

  final String leftString;
  final String rightString;
  final Function() leftCallback;
  final Function() rightCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorTheme.cardBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton(
              onPressed: leftCallback,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                foregroundColor: ColorTheme.pointText,
                textStyle: Theme.of(context).textTheme.titleMedium,
              ),
              child: Text(leftString),
            ),
          ),
          Container(width: 2, height: 32, color: ColorTheme.stroke),
          Expanded(
            child: TextButton(
              onPressed: rightCallback,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                foregroundColor: ColorTheme.pointText,
                textStyle: Theme.of(context).textTheme.titleMedium,
              ),
              child: Text(rightString),
            ),
          ),
        ],
      ),
    );
  }
}
