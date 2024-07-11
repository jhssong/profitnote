import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/pay_history_widget.dart';
import 'package:profitnote/screens/search/widgets/search_history_widget.dart';
import 'package:profitnote/widgets/card_widget.dart';
import 'package:profitnote/widgets/transaction_item_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

List<String> list = [
  "맛나분식1",
  "맛나분식2",
  "맛나분식3",
  "맛나분식4",
  "맛나분식5",
  "맛나분식6",
  "맛나분식7",
  "맛나분식8",
  "맛나분식9",
  "맛나분식10",
  "맛나분식11",
  "맛나분식12",
  "맛나분식13",
  "맛나분식14",
  "맛나분식15",
  "맛나분식16",
  "맛나분식17",
  "맛나분식18",
  "맛나분식19",
  "맛나분식20",
  "맛나분식21",
  "맛나분식22",
];

List<String> filteredList = [];

class _SearchScreenState extends State<SearchScreen> {
  var textController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(),
          ),
          title: Column(
            children: [
              SearchBar(
                controller: textController,
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                backgroundColor:
                    WidgetStatePropertyAll(ColorTheme.cardBackground),
                textStyle: WidgetStatePropertyAll(
                    TextStyle(color: ColorTheme.cardText, fontSize: 16)),
                hintText: "검색어를 입력해주세요",
                hintStyle: WidgetStatePropertyAll(TextStyle(
                    color: ColorTheme.backgroundOfBackground, fontSize: 16)),
                leading: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 8)),
                    Icon(
                      Icons.search,
                      color: ColorTheme.cardText,
                      size: 20,
                    ),
                  ],
                ),
                trailing: [
                  if (textController.text.isNotEmpty)
                    IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: ColorTheme.cardText,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          filteredList = [];
                          textController.text = "";
                          focusNode.unfocus();
                        });
                      },
                    ),
                ],
                onChanged: (value) {
                  _onSearch(value);
                },
              ),
            ],
          ),
        ),
        body: _buildSearchResult());
  }

  void _onSearch(String value) {
    setState(() {
      filteredList = list
          .where((element) =>
              element.toLowerCase().contains(value.toLowerCase()) &&
              (value.isNotEmpty))
          .toList();
    });
  }

  Widget _buildSearchHistory() {
    return Column(children: [
      CardWidget(
        title: "최근 검색어",
        body: Column(children: [
          SearchHistoryWidget(
              label: "맛있나1",
              onTapped: () {
                textController.text = "맛있나1";
                // simulate enter key press
                _onSearch(textController.text);
                FocusScope.of(context).unfocus();
              }),
          SearchHistoryWidget(
            label: "맛없나1",
            onTapped: () {
              textController.text = "맛없나1";
              _onSearch(textController.text);
              FocusScope.of(context).unfocus();
            },
          ),
          SearchHistoryWidget(
            label: "맛나",
            onTapped: () {
              textController.text = "맛나";
              _onSearch(textController.text);
              FocusScope.of(context).unfocus();
            },
          ),
        ]),
      ),
    ]);
  }

  Widget _buildSearchResult() {
    if (textController.text.isEmpty) {
      return _buildSearchHistory();
    } else if (filteredList.map((e) => null).toList().isEmpty) {
      return Card(
        color: ColorTheme.cardBackground,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text("검색 결과가 없습니다.",
              style: TextStyle(color: ColorTheme.cardLabelText)),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            return const PayHistoryWidget(
              date: "2024.03.27",
              body: Column(
                children: [
                  TransactionItemWidget(),
                  TransactionItemWidget(),
                ],
              ),
            );
          });
    }
  }
}
