import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FeedOptionsList extends StatelessWidget {
  const FeedOptionsList({super.key,required this.showSnackbar});

  final Function(bool) showSnackbar;

  void _postRequest(String url, Map<String, dynamic> body) async {
    print("object");
    try {

      final response = await http.post(Uri.parse(url), body: body);
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

  Widget _buildOption(BuildContext context, String label, String url, Map<String, dynamic> body) {
    return ListTile(
      title: Text(label),
      onTap: () {
        if (url.isNotEmpty) {
          _postRequest(url, body);
        }
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildOption(context, "摸摸头", "http://124.222.89.110:5002/tell", {"message": "摸摸头"}),
          _buildOption(context, "投喂小鱼干", "http://124.222.89.110:5002/tell", {"message": "投喂小鱼干"}),
          _buildOption(context, "投喂粮食", "http://124.222.89.110:5002/tell", {"message": "投喂粮食"}),
        ],
      ),
    );
  }
}
