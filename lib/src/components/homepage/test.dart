import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  StreamController<String> _streamController = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: _streamController.stream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasError) return Text("发生错误: ${snapshot.error}");
          if (snapshot.hasData) {
            // 有新数据就刷新，这里会执行多次
            String content = snapshot.data ?? "";
            if (content.length > 0) {
              return Text(content);
            }
          }
          // 正在请求，转圈等待
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
