import 'package:flutter/material.dart';
import 'package:profitnote/widgets/pay_history_widget.dart';
import 'package:profitnote/widgets/transaction_item_widget.dart';

class RecentPayHistoryScreen extends StatefulWidget {
  const RecentPayHistoryScreen({super.key});

  @override
  State<RecentPayHistoryScreen> createState() => _RecentPayHistoryScreenState();
}

class _RecentPayHistoryScreenState extends State<RecentPayHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("최근 결제 내역"),
      ),
      body: _buildRecentHistory(),
    );
  }

  Widget _buildRecentHistory() {
    return ListView.builder(
        itemCount: 10,
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
