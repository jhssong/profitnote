import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/detail_btn.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.title,
    this.onPressed,
    required this.body,
  });

  final String title;

  /// If widget doesn't need detail button, then keep this as null
  final Function()? onPressed;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: ColorTheme.cardBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorTheme.cardLabelText),
              ),
              if (onPressed != null) DetailBtn(onPressed: onPressed!),
            ],
          ),
          const SizedBox(height: 8),
          // Body
          body,
        ],
      ),
    );
  }
}
