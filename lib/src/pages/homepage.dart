import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/globalBottomNavigationBar.dart';
import '../components/homepage/feedOptionsList.dart';
import 'dart:math';

import '../components/homepage/thoughtBubble.dart';
import '../components/homepage/threeColumnsWidget.dart';
import '../components/homepage/userProfileRow.dart';
import '../theme/theme.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double progressBarValue = Random().nextDouble();
  String imageUrl = '';

  void _showImages(BuildContext context, String imageUrl) {
    _postRequest("摸摸头");
    // 在这里执行你的操作并根据 imageUrl 更新状态或执行其他逻辑
    setState(() {
      this.imageUrl = imageUrl;
      setState(() {
        progressBarValue = 1.0;
      });
    });
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FeedOptionsList(
            showSnackbar: (bool success) {
              // CustomSnackbar(
              //   isSuccess: success,
              //   message: success ? "互动成功" : "互动失败",
              // ).showSnackBar(context);
            },
            showImages: _showImages);
      },
    );
  }

  void _postRequest(String res) async {
    try {
      final response = await http.post(
        Uri.parse("http://124.222.89.110:5002/tell"),
        body: {"message": res},
      );
      print(response);
      if (response.statusCode == 200) {
        print(true);
      } else {
        print(false);
        // 处理错误响应
      }
    } catch (error) {
      print(error);
      // 处理请求异常
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60),
          // PeriodicRequester(),
          // 用户信息
          UserProfileRow(),
          ThreeColumnsWidget(),
          Expanded(
            child: Container(
              child: Image(
                image: CachedNetworkImageProvider(
                  "https://image1.juramaia.com/Fo4eWwQQrC1Rm4eQ-Py48eGA1uCY",
                ),
              ),
            ),
          ),
          // 食物，
          Container(
            height: 80,
            child: Stack(
              children: [
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 56, // 设置高度
                        width: 56, // 设置宽度
                        child: Material(
                          elevation: 0,
                          shape: CircleBorder(),
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              // 点击事件处理逻辑
                            },
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              errorWidget: (BuildContext context, String url,
                                  dynamic error) {
                                return CachedNetworkImage(
                                  imageUrl:
                                      'https://image1.juramaia.com/Ft4R-z-pZQP3evoPz2uaFt5zKfDl',
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 15,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: progressBarValue, // 设置进度条的值，0.0 到 1.0 之间
                            backgroundColor: Colors.white,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF8D6E63)),
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
            height: 40,
            margin: EdgeInsets.only(top: 10, bottom: 10),
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
                          color: Colors.black, fontWeight: FontWeight.bold),
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
                    onPressed: () {},
                    child: Text(
                      'Bonded',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
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
