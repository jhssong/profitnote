import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

Future<void> showSelectionDialog(
  BuildContext context, {
  required String title,
  required List<String> bodyList,
  required Function dialogCallback,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ColorTheme.cardBackground,
        title: Center(child: Text(title)),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        contentTextStyle: Theme.of(context).textTheme.bodyMedium,
        content: Wrap(
          children: List.generate(bodyList.length, (index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      dialogCallback(bodyList[index]);
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      foregroundColor: ColorTheme.pointText,
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    child: Text(bodyList[index]),
                  ),
                ),
              ],
            );
          }),
        ),
      );
    },
  );
}
