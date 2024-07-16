import 'package:flutter/material.dart';
import 'package:profitnote/screens/setting/asset_setting_screen.dart';
import 'package:profitnote/screens/setting/budget_setting_screen.dart';
import 'package:profitnote/screens/setting/category_setting_screen.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/control_btn_group.dart';
import 'package:profitnote/screens/setting/widgets/setting_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _pop() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("설정"),
        iconTheme: IconThemeData(
          color: ColorTheme.cardLabelText,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ControlBtnGroup(
              titleList: const ['로그인/회원가입', '프리미엄 가입'],
              callbackList: [_pop, _pop],
            ),
            const SettingWidget(
              title: "일반",
              items: ["홈 화면 설정", "알림 설정", "보안"],
              //onTapped: (index) {}  // index마다 다른 기능을 수행하도록 설정
            ),
            const SizedBox(
              height: 16,
            ),
            SettingWidget(
                title: "예산 및 자산 관리",
                items: const ["예산 설정", "자산 설정", "분류 설정"],
                onTapped: (index) {
                  if (index == 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BudgetSettingScreen()));
                  } else if (index == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AssetSettingScreen()));
                  } else if (index == 2) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CategorySettingScreen()));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
