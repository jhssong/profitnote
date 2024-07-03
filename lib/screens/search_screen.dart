import 'package:flutter/material.dart';
import 'package:profitnote/screens/search_result_screen.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/search_history_widget.dart';
import 'package:profitnote/widgets/card_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("검색", style: TextStyle(color: ColorTheme.cardLabelText)),
        // add search field in appbar

        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorTheme.cardBackground,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorTheme.cardBackground, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: "검색어를 입력해주세요",
            hintStyle: TextStyle(color: ColorTheme.cardLabelText, fontSize: 16),
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchResultScreen(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              CardWidget(
                title: "최근 검색어",
                body: Column(children: [
                  SizedBox(
                    height: 40,
                    child: SearchHistoryWidget(
                      label: "맛있나",
                      onTapped: () {},
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: SearchHistoryWidget(
                      label: "맛없나",
                      onTapped: () {},
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: SearchHistoryWidget(
                      label: "맛나",
                      onTapped: () {},
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
