import 'package:flutter/material.dart';
import 'package:profitnote/screens/home_screen.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/date_widget.dart';
import 'package:profitnote/widgets/pay_history_widget.dart';
import 'package:profitnote/widgets/search_history_widget.dart';
import 'package:profitnote/widgets/card_widget.dart';
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
            // prefixIcon: IconButton(
            //   icon: const Icon(Icons.arrow_back),
            //   onPressed: () {
            //     //go to home_screen
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const HomeScreen(),
            //       ),
            //     );
            //   },
            // ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                PayHistoryWidget(
                  header: DateWidget(label: '2024.03.27'),
                  body: Column(
                    children: [
                      TransactionItemWidget(onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
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
          ),
          Container(
            child: Column(
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
          ),
        ],
      ),
    );
  }
}
