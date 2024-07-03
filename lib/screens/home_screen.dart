import 'package:flutter/material.dart';
import 'package:profitnote/screens/budget_screen.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/card_widget.dart';
import 'package:profitnote/widgets/transaction_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profit Note"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        foregroundColor: ColorTheme.cardLabelText,
        backgroundColor: ColorTheme.backgroundOfBackground,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWidget(
              title: "총 자산",
              onPressed: () {},
              body: Row(
                children: [
                  Text("3,849,752원",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorTheme.cardText,
                      )),
                ],
              ),
            ),
            CardWidget(
              title: "예산",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BudgetScreen(),
                  ),
                );
              },
              body: Row(
                children: [
                  Text("130,000원 / 400,000원",
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
            CardWidget(
              title: "최근 결제 내역",
              onPressed: () {},
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
    );
  }
}
