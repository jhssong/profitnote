import 'package:flutter/material.dart';

class TransactionItemWidget extends StatelessWidget {
  const TransactionItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "21:12",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "식비 - 주식",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    "맛나분식",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          )),
          const SizedBox(width: 16),
          Text(
            "-5000",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
