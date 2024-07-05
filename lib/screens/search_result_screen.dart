import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/date_widget.dart';
import 'package:profitnote/widgets/pay_history_widget.dart';
import 'package:profitnote/widgets/transaction_item_widget.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("검색", style: TextStyle(color: ColorTheme.cardLabelText)),
        // add search field in appbar
        title: TextField(
          decoration: InputDecoration(
            hintText: "맛나분식",
            hintStyle: TextStyle(color: ColorTheme.cardLabelText, fontSize: 16),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              PayHistoryWidget(
                header: const DateWidget(label: '2024.03.27'),
                body: Column(
                  children: [
                    TransactionItemWidget(onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              PayHistoryWidget(
                header: const DateWidget(label: '2024.03.24'),
                body: Column(
                  children: [
                    TransactionItemWidget(onPressed: () {}),
                    TransactionItemWidget(onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              PayHistoryWidget(
                header: const DateWidget(label: '2024.03.23'),
                body: Column(
                  children: [
                    TransactionItemWidget(onPressed: () {}),
                    TransactionItemWidget(onPressed: () {}),
                    TransactionItemWidget(onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
