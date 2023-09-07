import 'package:flutter/cupertino.dart';

class ColumnsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:20,left: 40,bottom: 20,right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '小女生',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              Text(
                '性别:',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '五个月',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

              Text(
                '性别:',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '2个月',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

              Text(
                '年龄:',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}