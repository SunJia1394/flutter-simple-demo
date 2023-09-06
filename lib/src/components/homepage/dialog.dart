import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final Function onClosePressed;
  final Function onButtonPressed;
  final bool isOpen; // 添加 isOpen 变量

  CustomAlertDialog({
    required this.title,
    required this.content,
    required this.onClosePressed,
    required this.onButtonPressed,
    required this.isOpen, // 接收 isOpen 属性
  });

  @override
  Widget build(BuildContext context) {
    if (!isOpen) {
      return SizedBox(); // 如果 isOpen 为 false，则返回空的 SizedBox
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(20),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              onClosePressed();
            },
          ),
        ],
      ),
      content: Text(
        content,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              onButtonPressed();
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(141, 110, 99, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            child: Text(
              "Button",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
