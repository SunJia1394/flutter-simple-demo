import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/animalDerailPage/animalDetailList.dart';
import '../components/animalUpdatesPage/avatarList.dart';
import '../components/globalBottomNavigationBar.dart';
import '../components/ipPage/ButtonRow.dart';
import '../components/search.dart';
import '../mook/mook.dart';

class IpPage extends StatefulWidget {
  const IpPage({super.key});

  @override
  State<IpPage> createState() => _SearchpageState();
}

class _SearchpageState extends State<IpPage> {
  var item = articleList[2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messgaes"),
        centerTitle: true,
      ),
      bottomNavigationBar: GlobalBottomNavigationBar(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchComponent(),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top:10,left: 20,right: 20,bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://p.qqan.com/up/2020-10/16037671306141706.jpg',
                  fit: BoxFit.cover, // 设置图片填充类型为填充满容器
                ),
              ),
            ),
            Row(children: [
              SizedBox(width: 20),
              Text("功能",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),)
            ]),
            FourButtonRow(),
            SizedBox(height: 20),
            Row(children: [
              SizedBox(width: 20),
              Text("动物圈子",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),)
            ]),
            Container(
              padding: EdgeInsets.only(top: 10,left: 20,bottom: 20,right: 20),
                child: Column(
              children: [
                AdaptiveImageGrid(
                  images: item["articleDetail"]["images"],
                ),
              ],
            ))

          ],
        ),
      )
    );
  }
}
