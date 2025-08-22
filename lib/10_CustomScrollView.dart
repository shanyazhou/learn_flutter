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
        title: Text("Sliver"),
        backgroundColor: Colors.purpleAccent,
      ),
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
        SliverSafeArea(/// 安全区域（安全区域也可以滑过去）
          sliver: SliverPadding(// 这个间距，可以滑过去
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                      return Container(
                        /// 随机颜色
                        color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
                      );
                  },
                  childCount: 50
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,// 一行3个
                childAspectRatio: 1.5,// 宽1 高0.5
                crossAxisSpacing: 10, // 交叉轴间距（这里是左右间距）8
                mainAxisSpacing: 5,//主轴间距（在这里是上下间距）
              ),
            
            ),
          ),
        )
      ],
    );
  }
}
