import 'package:app_learn/src/components/globalBottomNavigationBar.dart';

import 'package:flutter/material.dart';
import 'package:app_learn/src/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    void handleItemSelection(int index) {
      // 处理按钮点击事件
      selectedIndex = index;
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: HomePage(),

      ),
    );
  }
}
