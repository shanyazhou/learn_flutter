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
        body: YZHomeCustomScrollViewContent()
    );
  }
}

class YZHomeCustomScrollViewContent extends StatefulWidget {
  const YZHomeCustomScrollViewContent({super.key});

  @override
  State<YZHomeCustomScrollViewContent> createState() => _YZHomeCustomScrollViewContentState();
}

class _YZHomeCustomScrollViewContentState extends State<YZHomeCustomScrollViewContent> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            backgroundColor: Colors.lightGreenAccent,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Hello World~"),
              background: Image(image: AssetImage("assets/images/1211.png"), fit: BoxFit.cover,),
            ),
            pinned: true,
        ),

        SliverGrid(
          delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  /// 随机颜色
                  color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
                );
              },
              childCount: 9
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,// 一行3个
            childAspectRatio: 1.5,// 宽1 高0.5
            crossAxisSpacing: 10, // 交叉轴间距（这里是左右间距）8
            mainAxisSpacing: 5,//主轴间距（在这里是上下间距）
          ),

        ),

        SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text("Hello World $index"),
                  );
                },
                childCount: 20
            )
        ),

      ],
    );
  }
}
