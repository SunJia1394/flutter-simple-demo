import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserProfileRow extends StatelessWidget {
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
                "用户姓名",
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
                    Icons.location_on,
                    color: Color(0xFF8D6E63),
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "上海",
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
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Color.fromRGBO(69, 47, 41, 1),
            size: 35,
          ),
          onPressed: () {
            // 响铃图标的点击事件处理
          },
        ),
        SizedBox(width: 40,)
      ],
    );
  }
}