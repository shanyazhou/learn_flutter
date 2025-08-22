
import 'package:learn_flutter/Service/http_request.dart';

class HomeRequest{
  static Future requestMovieList() async {
    // 构建url
    final movieURL = "";

    // 获取请求结果
    final result = await HttpRequest.request(movieURL);

    // 将Json转换成model

  }
}