import 'package:flutter/material.dart';

class TransactionItemWidget extends StatelessWidget {
  const TransactionItemWidget({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "식비 - 주식 | 토스뱅크",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    "맛나분식",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          )),
          const SizedBox(width: 16),
          Text(
            "-5,000원",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
