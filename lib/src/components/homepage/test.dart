import 'package:app_learn/src/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FeedOptionsList extends StatelessWidget {
  const FeedOptionsList({super.key, required this.showSnackbar});

  final Function(bool) showSnackbar;

  void _postRequest(String url, Map<String, dynamic> body) async {
    print(body.runtimeType);
    try {
      final response = await http
          .post(Uri.parse("http://124.222.89.110:5002/tell"), body: body);
      print(response);
      if (response.statusCode == 200) {
        print(true);
        showSnackbar(true);
      } else {
        print(false);
        // 处理错误响应
        showSnackbar(false);
      }
    } catch (error) {
      print(error);
      // 处理请求异常
      showSnackbar(false);
    }
  }

  Widget _buildOption(BuildContext context, String label,price, String url,
      Map<String, dynamic> body) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      margin: EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          if (url.isNotEmpty) {
            _postRequest(url, body);
          }
          Navigator.pop(context);
        },
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  url,
                ),
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '$price 货币',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
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
          Container(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              children: [
                _buildOption(
                    context,
                    "摸摸头",
                    "10",
                    "https://image1.juramaia.com/Fo4eWwQQrC1Rm4eQ-Py48eGA1uCY",
                    {"message": "摸摸头"}),
                _buildOption(
                    context,
                    "投喂小鱼干",
                    "6",
                    "https://image1.juramaia.com/Fo4eWwQQrC1Rm4eQ-Py48eGA1uCY",
                    {"message": "投喂小鱼干"}),
                _buildOption(
                    context,
                    "投喂粮食",
                    "6",
                    "https://image1.juramaia.com/Fo4eWwQQrC1Rm4eQ-Py48eGA1uCY",
                    {"message": "投喂粮食"}),
                _buildOption(
                    context,
                    "自定义1",
                    "6",
                    "https://image1.juramaia.com/Fo4eWwQQrC1Rm4eQ-Py48eGA1uCY",
                    {"message": "自定义1"}),
                _buildOption(
                    context,
                    "自定义2",
                    "6",
                    "https://image1.juramaia.com/Fo4eWwQQrC1Rm4eQ-Py48eGA1uCY",
                    {"message": "自定义2"}),
                _buildOption(
                    context,
                    "自定义3",
                    "6",
                    "https://image1.juramaia.com/Fo4eWwQQrC1Rm4eQ-Py48eGA1uCY",
                    {"message": "自定义3"}),
                _buildOption(
                    context,
                    "自定义4",
                    "6",
                    "https://image1.juramaia.com/Fo4eWwQQrC1Rm4eQ-Py48eGA1uCY",
                    {"message": "自定义4"}),
              ],
            ),
          ),
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
                    onPressed: () {},
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
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        '发送',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
