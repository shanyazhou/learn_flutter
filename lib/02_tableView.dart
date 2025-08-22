import 'package:flutter/material.dart';

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


class YZHomePage extends StatelessWidget {
  static const String routeName = "/02_tableView";
  const YZHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(// 脚手架
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: YZHomeContent(),
    );
  }
}

class YZHomeContent extends StatelessWidget {
  const YZHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        YZHomeProductItem("Apple1", "MacOS1", "https://yys-stsassum.oss-cn-hangzhou.aliyuncs.com/image/1666614128008_2897.png"),
        SizedBox(height: 5),
        YZHomeProductItem("Apple2", "MacOS2", "https://yys-stsassum.oss-cn-hangzhou.aliyuncs.com/image/1666614128008_2897.png"),
        SizedBox(height: 5),
        YZHomeProductItem("Apple3", "MacOS3", "https://yys-stsassum.oss-cn-hangzhou.aliyuncs.com/image/1666614128008_2897.png"),
        SizedBox(height: 5),
      ],
    );
  }
}

class YZHomeProductItem extends StatelessWidget {

  //const YZHomeProductItem({super.key});

  final String title;
  final String desc;
  final String imageURL;
  final style2 = TextStyle(fontSize: 20, color: Colors.green);

  YZHomeProductItem(this.title, this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.lightBlue, width: 3
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 25, color: Colors.orange)),
          Text(desc, style: style2),
          SizedBox(height: 10,),//间距的作用
          Image.network(imageURL),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}


