import 'package:flutter/material.dart';
import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/style/theme.dart';

void showDatePickerDialog({
  required context,
  required dialogCallback,
}) async {
  final res = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), // TODO Change to input datetime
    firstDate: DateTime(Constants.firstDate),
    lastDate: DateTime(Constants.lastDate),
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
    dialogCallback(res.toString());
  }
}
