import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class ControlBtnGroup extends StatelessWidget {
  const ControlBtnGroup({
    super.key,
    required this.titleList,
    required this.callbackList,
  });

  final List<String> titleList;
  final List<Function()> callbackList;

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
          for (int index = 0; index < titleList.length; index++) ...[
            Expanded(
              child: TextButton(
                onPressed: callbackList[index],
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  foregroundColor: ColorTheme.pointText,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
                child: Text(titleList[index]),
              ),
            ),
            if (index < titleList.length - 1)
              Container(width: 2, height: 32, color: ColorTheme.stroke),
          ],
        ],
      ),
    );
  }
}
