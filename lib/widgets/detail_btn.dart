import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class DetailBtn extends StatelessWidget {
  const DetailBtn({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: ColorTheme.pointColor,
            padding: const EdgeInsets.all(0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            foregroundColor: ColorTheme.pointText,
            textStyle: const TextStyle(fontSize: 12)),
        child: const Text('더보기'),
      ),
    );
  }
}
