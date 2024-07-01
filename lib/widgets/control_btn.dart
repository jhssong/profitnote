import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class ControlBtn extends StatelessWidget {
  const ControlBtn({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      width: 100,
      height: 40,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: ColorTheme.cardBackground,
          padding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          foregroundColor: ColorTheme.pointText,
          textStyle: Theme.of(context).textTheme.titleMedium,
        ),
        child: const Text('저장'),
      ),
    );
  }
}
