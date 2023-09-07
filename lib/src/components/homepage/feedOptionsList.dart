import 'package:app_learn/src/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'optionsList.dart';

class FeedOptionsList extends StatefulWidget {
  const FeedOptionsList(
      {Key? key, required this.showSnackbar, required this.showImages})
      : super(key: key);

  final void Function(bool success) showSnackbar;
  final void Function(BuildContext context, String imageUrl,String submitMsg)
      showImages; // 添加 showImages 方法

  @override
  State<FeedOptionsList> createState() => _FeedOptionsListState();
}

class _FeedOptionsListState extends State<FeedOptionsList> {
  List<Map<String, dynamic>> options = [
    {
      "label": "Milk",
      "url": "6",
      "image": "assets/Milk.png",
      "sendUrl": "http://image1.juramaia.com/Fjuh4hwm7qal3Uu5Ut2ZrSm0UIus",
      "body": "投喂Milk",
    },
    {
      "label": "冻干",
      "url": "10",
      "image": "assets/冻干.png",
      "sendUrl": "http://image1.juramaia.com/Fj0Bh6cPI0auRjeJbc63jpxFOxqy",
      "body": "投喂冻干",
    },
    {
      "label": "猫条",
      "url": "6",
      "image": "assets/猫条.png",
      "sendUrl": "http://image1.juramaia.com/Fj0Bh6cPI0auRjeJbc63jpxFOxqy",
      "body": "投喂猫条",
    },
    {
      "label": "鱼干",
      "url": "6",
      "image": "assets/鱼干.png",
      "sendUrl": "http://image1.juramaia.com/Fj0Bh6cPI0auRjeJbc63jpxFOxqy",
      "body": "投喂鱼干",
    },
    {
      "label": "鱼油",
      "url": "6",
      "image": "assets/鱼油.png",
      "sendUrl": "http://image1.juramaia.com/Fj0Bh6cPI0auRjeJbc63jpxFOxqy",
      "body": "投喂鱼油",
    },
    {
      "label": "鸡胸肉",
      "url": "6",
      "image": "assets/鸡胸肉.png",
      "sendUrl": "http://image1.juramaia.com/Fj0Bh6cPI0auRjeJbc63jpxFOxqy",
      "body": "投喂鸡胸肉",
    },

    // Add more options as needed
  ];

  int selectedOption = -1; // 初始值设定为 -1，表示没有选项被选择

  void onOptionSelected(int value) {
    setState(() {
      selectedOption = value;
    });
  }

  void onHandClick() {
    if (selectedOption >= 0 && selectedOption < options.length) {
      widget.showImages(context, options[selectedOption]["sendUrl"],options[selectedOption]["body"]);
      Navigator.pop(context);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "食物",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "玩具",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 20),
              Text(
                "洗护",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
              height: 220,
              child: MyOptionsWidget(
                options: options,
                onOptionSelected: onOptionSelected,
                isSelected: selectedOption,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text("86货币"),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "充值",
                    style: TextStyle(
                      color: Color.fromRGBO(247, 162, 120, 1.0),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Color.fromRGBO(247, 162, 120, 1.0),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      onHandClick();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      child: Text(
                        '发送',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
