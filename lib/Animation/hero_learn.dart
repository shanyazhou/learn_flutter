import 'package:flutter/material.dart';
import 'dart:math';

import 'package:learn_flutter/Animation/image_detail.dart';


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
      body: YZHomeGridViewContent(),
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
            crossAxisCount: 2,// 一行3个
            childAspectRatio: 1.5,// 宽1 高0.5
            crossAxisSpacing: 10, // 交叉轴间距（这里是左右间距）8
            mainAxisSpacing: 5,//主轴间距（在这里是上下间距）
          ),
          children: List.generate(100, (index){
            final imageUrl = "https://picsum.photos/500/500?random=$index";
            return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    PageRouteBuilder(pageBuilder: (context, animation1, animation2){
                      return FadeTransition(
                          opacity: animation1,
                          child: YZImageDetailPage(imageUrl: imageUrl)
                      );
                    })
                  );
                },
                child: Hero(
                    tag: imageUrl,
                    child: Image.network(imageUrl, fit: BoxFit.fitWidth,)
                )
            );
          }) 
      ),
    );
  }
}