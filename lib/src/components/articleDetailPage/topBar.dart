import 'package:app_learn/src/pages/animalDetailPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../networkImageLoader.dart';

class DetailPageTopBar extends StatelessWidget {
  final String name;
  final String avatarUrl;

  DetailPageTopBar({required this.name, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              // 在这里执行页面跳转操作
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnimalDetailPage()),
              );
            },
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(avatarUrl),
            ),
          ),
          SizedBox(width: 8),
          Text(
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }}