import 'package:app_learn/src/pages/animalUpdatesPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/globalBottomNavigationBar.dart';
import '../components/homepage/customSnackbar.dart';
import '../components/homepage/feedOptionsList.dart';
import 'dart:math';

import '../theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double progressBarValue = Random().nextDouble();

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FeedOptionsList(showSnackbar: (bool success) {
          CustomSnackbar(
            isSuccess: success,
            message: success ? "互动成功" : "互动失败",
          ).showSnackBar(context);

          if (success) {
            // 将进度条的值设置为 1.0，表示进度已满
            setState(() {
              progressBarValue = Random().nextDouble();
            });
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          // 用户信息
          Row(
            children: [
              SizedBox(width: 20),
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://p.qqan.com/up/2020-10/16037671306141706.jpg"), // 替换成用户头像的URL
              ),
              SizedBox(width: 10),
              Text(
                "用户姓名",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          // 食物，
          Container(
            height: 80,
            child: Stack(
              children: [
                Positioned(
                  right: 20,
                  bottom: 0,
                  child: Row(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          // 点击食盆图标的回调函数
                        },
                        child: Icon(Icons.pets),
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 20,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: progressBarValue, // 设置进度条的值，0.0 到 1.0 之间
                            backgroundColor: Colors.grey[300],
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 操作按钮
          Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () {
                      _showOptions(context);
                    },
                    child: Text(
                      'Feed',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black, // 边框颜色
                        width: 1.5, // 边框宽度
                      ),
                      borderRadius: BorderRadius.circular(12), // 按钮四角圆角半径
                    ),
                  ),
                ),
                SizedBox(width: 10),

                // 查看消息按钮
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
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
                    },
                    child: Text(
                      'Messgae',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black, // 边框颜色
                        width: 1.5, // 边框宽度
                      ),
                      borderRadius: BorderRadius.circular(12), // 按钮四角圆角半径
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlobalBottomNavigationBar(),
    );
  }
}
