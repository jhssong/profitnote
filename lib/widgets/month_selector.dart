import 'package:flutter/material.dart';
import 'package:profitnote/style/theme.dart';

class MonthSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 50,
      decoration: BoxDecoration(
        color: ColorTheme.backgroundOfBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back, size: 12),
                color: ColorTheme.cardText,
                onPressed: () {},
              ),
              Text('2024.05', style: Theme.of(context).textTheme.labelSmall),
              IconButton(
                  icon: Icon(Icons.arrow_forward, size: 12),
                  color: ColorTheme.cardText,
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

// class DetailBtn extends StatelessWidget {
//   const DetailBtn({super.key, required this.onPressed});

//   final Function() onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 24,
//       child: TextButton(
//         onPressed: onPressed,
//         style: TextButton.styleFrom(
//             backgroundColor: ColorTheme.pointColor,
//             padding: const EdgeInsets.all(0),
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             foregroundColor: ColorTheme.pointText,
//             textStyle: const TextStyle(fontSize: 12)),
//         child: const Text('더보기'),
//       ),
//     );
//   }
// }

