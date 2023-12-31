import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void askGPT(String problem,  Function(String) setData) {
  final messages = [
    {
      "role": "user",
      "content": problem,
    },
  ];

  final requestBody = {
    "messages": messages,
    "temperature": 0.5,
    "stream": true // 想流式接收数据必须填写该参数！
  };

  var request = http.Request(
      "Get", Uri.parse("http://124.222.89.110:5002/listenThoughts"));
  request.headers["Content-Type"] = "application/json; charset=UTF-8";

  StreamController<String> _streamController = StreamController<String>();

  print("--------------------------");

  // 开始请求
  http.Client().send(request).then((response) {
    String showContent = "";
    final stream = response.stream.transform(utf8.decoder);
    // 监听接收的数据
    stream.listen(
      (data) {
        print("------------------response----");
        final dataLines =
            data.split("\n").where((element) => element.isNotEmpty).toList();
        for (String line in dataLines) {
          // 丢弃前6个字符：“data: ”
          if (!line.startsWith("data: ")) continue;
          final data = line.substring(6);

          if (data == "[DONE]") break; // 表示接收已完成

          // 解析数据
          // Map<String, dynamic> responseData = json.decode(data);
          // 调用 setData 回调函数，传递接收到的数据
          setData(data);

          print("----------------");
          print(data);
          print("----------------");
          // _streamController.add(msg);

          // if (choice["finish_reason"] != null) break; // 表示接收已完成
        }
      },
      onDone: () => _streamController.add(showContent),
      onError: (error) => _streamController.addError(error),
    );
  });
}
