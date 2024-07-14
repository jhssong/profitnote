import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profitnote/style/theme.dart';

class MonthSelector extends StatefulWidget {
  const MonthSelector({super.key});

  @override
  State<StatefulWidget> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  DateTime _selectedDate = DateTime.now();

  void _previousMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy.MM').format(_selectedDate);
    return Container(
      // width: 140,
      // height: 50,
      decoration: BoxDecoration(
        color: ColorTheme.backgroundOfBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 24,
                height: 24,
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.chevron_left_rounded, size: 16),
                  color: ColorTheme.cardText,
                  onPressed: () {
                    _previousMonth();
                  },
                ),
              ),
              Text(formattedDate,
                  style: Theme.of(context).textTheme.labelMedium),
              SizedBox(
                width: 24,
                height: 24,
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(Icons.chevron_right_rounded, size: 16),
                    color: ColorTheme.cardText,
                    onPressed: () {
                      _nextMonth();
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
