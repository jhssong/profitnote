import 'package:flutter/material.dart';
import 'package:profitnote/screens/home/widgets/pay_detail_card.dart';
import 'package:profitnote/widgets/card_widget.dart';

class PayDetailScreen extends StatelessWidget {
  const PayDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("상세 내역"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PayDetailCard(),
            const CardWidget(
              title: "메모",
              body: Text("없음"),
            ),
            const CardWidget(
              title: "정산",
              body: Text("없음"),
            ),
            CardWidget(
              title: "정산",
              body: Column(
                children: [
                  const SizedBox(height: 8),
                  for (int i = 0; i < 5; i++) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text("홍길동", textAlign: TextAlign.left),
                        ),
                        Expanded(
                          flex: 2,
                          child:
                              Text("${1000 * i}원", textAlign: TextAlign.center),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            i % 2 == 0 ? '완료' : '미완료',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
