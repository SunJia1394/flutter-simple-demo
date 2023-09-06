import 'package:flutter/cupertino.dart';

class ThreeColumnsWidget extends StatelessWidget {
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
                '1',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              Text(
                'Came',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '2',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

              Text(
                'Bonded',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '3',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

              Text(
                'Follow',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}