import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/animalUpdatesPage/avatarList.dart';
import '../components/animalUpdatesPage/itemCrad.dart';
import '../components/globalBottomNavigationBar.dart';
import '../components/search.dart';
import '../mook/mook.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OneAnimalDetailPage extends StatefulWidget {
  const OneAnimalDetailPage({super.key});

  @override
  State<OneAnimalDetailPage> createState() => _State();
}

class _State extends State<OneAnimalDetailPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
        centerTitle: true,
      ),
      bottomNavigationBar: GlobalBottomNavigationBar(),

      body: SmartRefresher(
          enablePullUp: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: articleList.length,
                  itemBuilder: (context, index) {
                    final item = articleList[index];
                    return ItemCard(
                      avatarPath: item['avatarPath'],
                      avatarName: item['avatarName'],
                      brief: item['brief'],
                      imageUrl: item['imageUrl'],
                      comments: item['comments'],
                      likes: item['likes'],
                    );
                  },
                ),
              ],
            ),
          )
      ),
    );
  }
}
