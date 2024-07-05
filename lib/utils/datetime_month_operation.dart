DateTime getPreviousMonthDate(DateTime selectedDate) {
  DateTime previousMonth =
      DateTime(selectedDate.year, selectedDate.month - 1, selectedDate.day);

  if (previousMonth.month < 1) {
    previousMonth = DateTime(
        previousMonth.year - 1, previousMonth.month + 12, previousMonth.day);
  }

  return previousMonth;
}

DateTime getNextMonthDate(DateTime selectedDate) {
  DateTime nextMonth =
      DateTime(selectedDate.year, selectedDate.month + 1, selectedDate.day);

  if (nextMonth.month > 12) {
    nextMonth =
        DateTime(nextMonth.year + 1, nextMonth.month - 12, nextMonth.day);
  }

  return nextMonth;
}
