import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class ProfileWidget extends StatelessWidget {
  final String avatarPath;
  final String name;

  const ProfileWidget({
    required this.avatarPath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        CircleAvatar(
          radius: 30,
          backgroundImage: CachedNetworkImageProvider(
              "https://p.qqan.com/up/2020-10/16037671306141706.jpg"), // 替换成用户头像的URL
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "动物姓名",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.pets,
                    color: Color(0xFF8D6E63),
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "小橘猫",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF8D6E63),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        OutlinedButton(
          onPressed: () {
            // 关注按钮的点击事件处理
          },
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: Colors.black),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          child: Text(
            '关注',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(width: 40,)
      ],
    );
  }
}
