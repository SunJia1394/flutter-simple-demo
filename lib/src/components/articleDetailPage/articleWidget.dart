import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class ArticleWidget extends StatelessWidget {
  final String title;
  final List<Map<String, String>> article;

  ArticleWidget({required this.title, required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      Container(
        padding: EdgeInsets.only(top: 20, left: 20),
        width: MediaQuery.of(context).size.width - 10,
        child: Text(
          title,
          textAlign: TextAlign.left,

          style: AppTheme.themeData.textTheme.headline1,
        ),
      ),
      Column(
          children: article.map((item) {
        if (item['state'] == 'text') {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              item['content']!,
              textAlign: TextAlign.left,
            ),
          );
        } else if (item['state'] == 'segmentation') {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(item['content']!,style:TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          );
        }
        return Container();
      }).toList())
    ]);
  }
}
