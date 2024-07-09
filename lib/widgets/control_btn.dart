import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class ControlBtn extends StatelessWidget {
  const ControlBtn({
    super.key,
    this.text = "저장",
    required this.onPressed,
  });

  final String text;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: ColorTheme.cardBackground,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          foregroundColor: ColorTheme.pointText,
          textStyle: Theme.of(context).textTheme.titleMedium,
        ),
        child: Text(text),
      ),
    );
  }
}
