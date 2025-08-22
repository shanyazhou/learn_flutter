import 'package:flutter/material.dart';
import 'dart:math';


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


class YZHomePage extends StatelessWidget {
  const YZHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget布局"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: YZHomeGridViewBuildContent(),
    );
  }
}

class YZHomeGridViewContent extends StatefulWidget {
  const YZHomeGridViewContent({super.key});

  @override
  State<YZHomeGridViewContent> createState() => _YZHomeGridViewContentState();
}

class _YZHomeGridViewContentState extends State<YZHomeGridViewContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),// 左右边框8间距
      child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,// 一行3个
              childAspectRatio: 1.5,// 宽1 高0.5
              crossAxisSpacing: 10, // 交叉轴间距（这里是左右间距）8
              mainAxisSpacing: 5,//主轴间距（在这里是上下间距）
          ),
          children: List.generate(100, (index){
            return Container(
              /// 随机颜色
              color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
            );
          })
      ),
    );
  }
}

class YZHomeGridViewBuildContent extends StatefulWidget {
  const YZHomeGridViewBuildContent({super.key});

  @override
  State<YZHomeGridViewBuildContent> createState() => _YZHomeGridViewBuildContentState();
}

class _YZHomeGridViewBuildContentState extends State<YZHomeGridViewBuildContent> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,// 一行3个
          childAspectRatio: 1.5,// 宽1 高0.5
          crossAxisSpacing: 10, // 交叉轴间距（这里是左右间距）8
          mainAxisSpacing: 5,//主轴间距（在这里是上下间距）
        ),
        itemBuilder: (BuildContext context, int index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello Word~ ${index + 1}", style: TextStyle(fontSize: 20, color: Colors.brown),),//忘记加return了，注意下
              Divider(height: 1,)
            ]
          );
          }
    );
  }
}
