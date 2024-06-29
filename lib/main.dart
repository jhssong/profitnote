import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profitnote/screens/home_screen.dart';
import 'package:profitnote/style/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: ColorTheme.background,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const SafeArea(child: HomeScreen()),
    );
  }
}
