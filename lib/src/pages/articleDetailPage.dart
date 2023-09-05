import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../components/articleDetailPage/articleWidget.dart';
import '../components/articleDetailPage/commentComponent.dart';
import '../components/articleDetailPage/topBar.dart';
import '../mook/mook.dart';
import '../components/articleDetailPage/fullWidthSlider.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({super.key});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
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

  var item = articleList[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor:Colors.white,
          title: DetailPageTopBar(
              name: item["avatarName"], avatarUrl: item["avatarPath"]),
        ),
        body: SmartRefresher(
          enablePullUp: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView(children: [
            FullWidthSlider(images: item["articleDetail"]["images"]),
            ArticleWidget(
                title: item["articleTitle"],
                article: item["articleDetail"]["article"]),
            SizedBox(height: 20),
            CommentComponent(
              comments: item["articleDetail"]["comments"],
            )
          ]),
        ));
  }
}
