import 'package:flutter/material.dart';
import 'package:profitnote/constants/constants.dart';
import 'package:profitnote/style/theme.dart';
import 'package:intl/intl.dart';

void showDatePickerDialog({
  required context,
  now,
  required dialogCallback,
}) async {
  now ??= DateTime.now();
  final res = await showDatePicker(
    context: context,
    initialDate: now,
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
    String formattedDate = DateFormat('yyyy-MM-dd').format(res);
    dialogCallback(formattedDate);
  }
}
