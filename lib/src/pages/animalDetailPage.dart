import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../components/animalDerailPage/animalDetailList.dart';
import '../components/animalDerailPage/animalInfo.dart';
import '../components/articleDetailPage/topBar.dart';
import '../mook/mook.dart';
import '../theme/theme.dart';

class AnimalDetailPage extends StatefulWidget {
  const AnimalDetailPage({super.key});

  @override
  State<AnimalDetailPage> createState() => _AnimalDetailPageState();
}

class _AnimalDetailPageState extends State<AnimalDetailPage> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    items = ["1", "2", "3", "4", "5", "6", "7", "8"];
    _refreshController.refreshCompleted();
    if (mounted) {
      setState(() {});
    }
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  var item = articleList[2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            ProfileWidget(
              name: "test",
              avatarPath: item["avatarPath"],
            ),
            Container(
                margin: EdgeInsets.only(top: 100),
                child: ListView(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height - 100,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: AppTheme.themeData.cardColor,
                      ),
                      child: ListView(children: [
                        AdaptiveImageGrid(
                          images: item["articleDetail"]["images"],
                        ),
                        SizedBox(height: 20,)
                      ]),
                    )
                  ],
                )),
          ],
        ));
  }
}
