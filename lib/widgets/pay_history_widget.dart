import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class PayHistoryWidget extends StatelessWidget {
  const PayHistoryWidget({
    super.key,
    required this.header,
    required this.body,
  });

  final Widget header;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              header,
            ],
          ),
          // Header
          const SizedBox(height: 8),
          body,
          // Body
        ],
      ),
    );
  }
}
