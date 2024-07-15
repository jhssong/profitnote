import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profitnote/provider/category_provider.dart';
import 'package:profitnote/screens/asset/asset_screen.dart';
import 'package:profitnote/screens/analysis/analysis_screen.dart';
import 'package:profitnote/screens/home/home_screen.dart';
import 'package:profitnote/screens/search/search_screen.dart';
import 'package:profitnote/screens/setting/setting_screen.dart';
import 'package:profitnote/style/theme.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ColorTheme.background,
  ));

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => CategoryProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentBottomNavIndex = 0;

  static const List<Widget> _screenList = <Widget>[
    HomeScreen(),
    SearchScreen(),
    AssetScreen(),
    AnalysisScreen(),
    SettingScreen(),
  ];

  void _onBottomNavTapped(int index) {
    setState(() => _currentBottomNavIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: ColorTheme.stroke, width: 2),
              ),
            ),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '홈',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: '검색',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card),
                  label: '자산',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart),
                  label: '통계',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_rounded),
                  label: '메뉴',
                ),
              ],
              currentIndex: _currentBottomNavIndex,
              onTap: _onBottomNavTapped,
            ),
          ),
          body: _screenList.elementAt(_currentBottomNavIndex),
        ),
      ),
    );
  }
}
