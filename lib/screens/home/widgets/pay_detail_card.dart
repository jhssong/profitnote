import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class PayDetailCard extends StatelessWidget {
  PayDetailCard({super.key});

  final labelList = ["이름", "금액", "자산", "카테고리", "날짜", "시간"];
  final titleList = [
    "맛나분식",
    "5,000원",
    "토스뱅크",
    "식비 - 주식",
    "2024-03-27",
    "12:12",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: ColorTheme.cardBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          for (int i = 0; i < labelList.length; i++) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  labelList[i],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  titleList[i],
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}
