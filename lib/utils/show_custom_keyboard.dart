import 'package:flutter/material.dart';
import 'package:profitnote/widgets/custom_keyboard_widget.dart';

void showKeyboard(BuildContext context, TextEditingController controller) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return CustomKeyboard(
        onKeyTap: (val) {
          controller.text += val.toString();
        },
        onBackspacePress: () {
          if (controller.text.isNotEmpty) {
            controller.text =
                controller.text.substring(0, controller.text.length - 1);
          }
        },
      );
    },
  );
}
