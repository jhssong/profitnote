import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

void showTimePickerDialog({
  required context,
  now,
  required dialogCallback,
}) async {
  now ??= TimeOfDay.now();
  final res = await showTimePicker(
    context: context,
    initialTime: now,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.dark(
            primary: ColorTheme.pointColor,
            onPrimary: ColorTheme.cardLabelText,
            surface: ColorTheme.cardBackground,
            onSurface: ColorTheme.cardText,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: ColorTheme.cardText,
            ),
          ),
        ),
        child: child!,
      );
    },
    helpText: "",
    cancelText: "취소",
    confirmText: "확인",
  );
  if (res != null) {
    dialogCallback("${res.hour.toString().padLeft(2, '0')}:${res.minute}");
  }
}
