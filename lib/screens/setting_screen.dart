import 'package:flutter/material.dart';
import 'package:profitnote/screens/asset_setting_screen.dart';
import 'package:profitnote/screens/budget_setting_screen.dart';
import 'package:profitnote/style/theme.dart';
import 'package:profitnote/widgets/control_btn_group.dart';
import 'package:profitnote/widgets/general_setting_widget.dart';

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
        title: Text("설정", style: TextStyle(color: ColorTheme.cardLabelText)),
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
            const GeneralSettingWidget(
              title: "일반",
              items: ["홈 화면", "알림", "보안"],
              //onTapped: (index) {}  // index마다 다른 기능을 수행하도록 설정
            ),
            GeneralSettingWidget(
                title: "예산 및 자산 관리",
                items: const ["예산 설정", "자산 설정"],
                onTapped: (index) {
                  if (index == 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BudgetSettingScreen()));
                  } else if (index == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AssetSettingScreen()));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
