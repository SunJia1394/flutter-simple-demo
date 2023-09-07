import 'package:app_learn/src/theme/theme.dart';
import 'package:flutter/material.dart';

class FourButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  width: 60,
                  // 设置容器宽度
                  height: 60,
                  // 设置容器高度
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => ImageUploader(),
                      //   ),
                      // );
                    },
                    color: Colors.white,
                  ),
                ),
                Text(
                  '流浪动物信息',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: 60,
                  // 设置容器宽度
                  height: 60,
                  // 设置容器高度
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                ),
                Text(
                  '附近救助站',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: 60,
                  // 设置容器宽度
                  height: 60,
                  // 设置容器高度
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                ),
                Text(
                  '动物商城',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: 60,
                  // 设置容器宽度
                  height: 60,
                  // 设置容器高度
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.medical_services,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                ),
                Text(
                  '护理站',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
