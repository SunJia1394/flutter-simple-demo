import 'dart:developer';

import 'package:app_learn/src/pages/homepage.dart';
import 'package:app_learn/src/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/IpPage.dart';
import '../pages/animalUpdatesPage.dart';

class GlobalBottomNavigationBar extends StatefulWidget {
  @override
  _GlobalBottomNavigationBarState createState() =>
      _GlobalBottomNavigationBarState();
}

class _GlobalBottomNavigationBarState extends State<GlobalBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              Container(
                  child: Column(
                children: [
                  SizedBox(height: 22),
                  Container(
                    height: 1,
                    color: Color.fromARGB(255, 141, 110, 99),
                  ),
                  Container(
                    height: 56,
                    color: Color.fromARGB(255, 232, 230, 227),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onItemSelected(1),
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: 20,
                                    color: Color.fromARGB(255, 141, 110, 99),
                                  ),
                                  SizedBox(height: 1.0), // 这里设置图标和文本之间的间距
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 141, 110, 99),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onItemSelected(2),
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.chat_bubble,
                                    size: 20,
                                    color: Color.fromARGB(255, 141, 110, 99),
                                  ),
                                  SizedBox(height: 1.0), // 这里设置图标和文本之间的间距
                                  Text(
                                    "Activity",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 141, 110, 99),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Positioned(
                top: 0.0,
                left: (MediaQuery.of(context).size.width - 56.0) / 2,
                child: GestureDetector(
                  onTap: () => _onItemSelected(0),
                  child: Container(
                    width: 56.0,
                    height: 56.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(28.0),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.pets,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _onItemSelected(int index) {
    setState(() {
      // 在这里处理按钮点击事件，根据需要进行相应的操作
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage(),
            ),
          );
          break;
        case 1:
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => IpPage(),
              // 新页面的构建器
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // 自定义过渡动画的构建器
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0.0), // 新页面从右侧滑动进入
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            ),
          );
          break;
        case 2:
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  AnimalUpdatesPage(),
              // 新页面的构建器
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // 自定义过渡动画的构建器
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0), // 新页面从右侧滑动进入
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            ),
          );
          break;
      }
    });
  }
}
