import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Dialog Title'),
      content: Text('Dialog Content'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // 关闭对话框
          },
          child: Text('Close'),
        ),
        TextButton(
          onPressed: () {
            // 处理按钮点击事件
          },
          child: Text('Button'),
        ),
      ],
    );
  }
}