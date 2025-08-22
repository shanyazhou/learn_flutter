import 'package:dio/dio.dart';
import 'package:learn_flutter/Service/config.dart';

class HttpRequest {
    // 基础设置
    static final BaseOptions baseOptions = BaseOptions(baseUrl: HttpConfig.baseURL, receiveTimeout: Duration(milliseconds: HttpConfig.timeout) );
    // 创建Dio
    static final Dio dio = Dio(baseOptions);

    static Future<T> request<T>(String url, {String method = "get", Map<String, dynamic>? params, Interceptor? inter}) async {
        /// 创建单独的配置
        final customOptions = Options(method: method);

        //全局拦截器

        // 创建默认的全局拦截器
        Interceptor defaultIter = InterceptorsWrapper(
          onRequest: (options, handler) {
            print("请求拦截");
            return handler.next(options);
          },
          onResponse: (response, handler) {
            print("响应拦截");
            return handler.next(response);
          },
          onError: (error, handler) {
            print("错误拦截");
            return handler.next(error);
          },
        );

        //搞一个数组，放默认拦截器
        List<Interceptor> inters = [defaultIter];

        //如果单独拦截器有值，则加到数组里面去
        if (inter != null) {
          inters.add(inter);
        }

        dio.interceptors.addAll(inters);

        // 发送网络请求
        try {
          Response response = await dio.request(url, queryParameters: params, options: customOptions);
          return response.data;
        } on DioError catch(e) {
          return Future.error(e);
      }
    }
}
