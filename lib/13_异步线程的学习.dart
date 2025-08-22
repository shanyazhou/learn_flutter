import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'Service/http_request.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: YZHomePage(),
    );
  }
}

class YZHomeButtonPage extends StatelessWidget {
  const YZHomeButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class YZHomePage extends StatefulWidget {

  const YZHomePage({super.key});

  @override
  State<YZHomePage> createState() => _YZHomePageState();
}

class _YZHomePageState extends State<YZHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 发送网络请求

    // 创建Dio对象
    // final dio = Dio();
    //
    // // 发送网络请求
    // dio.get("https://httpbin.org/get").then((res){
    //   print(res);
    // });
    //
    // dio.post("https://httpbin.org/post").then((res){
    //   print(res);
    // });

    HttpRequest.request("https://httpbin.org/get", params: {"name": "007"}).then((res){
      print(res);
    }).catchError((error){

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("123"),
      ),
      body: NotificationListener(
        child: ListView.builder(
          itemBuilder:(BuildContext context, int index){
            return ListTile(
              leading: Icon(Icons.people),
              title: Text("联系人 $index"),

              subtitle: Text("No. ${Random().nextInt(1000)}"),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}
