import 'package:app_learn/src/pages/articleDetailPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimalDetailListItem extends StatelessWidget {
  const AnimalDetailListItem({super.key,required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 处理点击事件，例如导航到新的页面
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArticleDetailPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
