import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../components/animalDerailPage/animalDetailList.dart';
import '../components/animalDerailPage/animalInfo.dart';
import '../components/animalDerailPage/columnsWidget.dart';
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
        appBar: AppBar(
          title: Text("动物详情"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              ProfileWidget(
                name: "test",
                avatarPath: item["avatarPath"],
              ),
              ColumnsWidget(),

              // Row(
              //   children: [
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Text(
              //       "//动物性格",
              //       style: TextStyle(
              //           fontSize: 20, color: Color.fromRGBO(25, 27, 28, 1)),
              //     ),
              //   ],
              // ),
              AdaptiveImageGrid(
                images: item["articleDetail"]["images"],
              ),
              Column(children: [

                SizedBox(
                  height: 20,
                )
              ]),
            ],
          ),
        ));
  }
}
