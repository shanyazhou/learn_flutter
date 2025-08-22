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
      body: YZHomeStackContent(),
      floatingActionButton: FloatingActionButton(//浮窗按钮
        onPressed: (){
          print("FloatingActionButton");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class YZHomeTextContent extends StatefulWidget {
  const YZHomeTextContent({super.key});

  @override
  State<YZHomeTextContent> createState() => _YZHomeTextContentState();
}

class _YZHomeTextContentState extends State<YZHomeTextContent> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("spaceBetween", style: TextStyle(fontSize: 18),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.lightGreenAccent,
            ),
            Container(
              width: 120,
              height: 80,
              color: Colors.red,
            ),
            Container(
              width: 40,
              height: 20,
              color: Colors.blue,
            ),
            Container(
              width: 70,
              height: 120,
              color: Colors.yellow,
            )
          ],
        ),
        Divider(
          height: 1, // 分割线高度（包含上下间距）
          thickness: 1, // 分割线本身的厚度
          color: Colors.grey, // 分割线颜色
        ),


        Text("spaceAround", style: TextStyle(fontSize: 18),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.lightGreenAccent,
            ),
            Container(
              width: 120,
              height: 80,
              color: Colors.red,
            ),
            Container(
              width: 40,
              height: 20,
              color: Colors.blue,
            ),
            Container(
              width: 70,
              height: 120,
              color: Colors.yellow,
            )
          ],
        ),

        Divider(
          height: 1, // 分割线高度（包含上下间距）
          thickness: 1, // 分割线本身的厚度
          color: Colors.grey, // 分割线颜色
        ),

        Text("spaceEvenly", style: TextStyle(fontSize: 18),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.lightGreenAccent,
            ),
            Container(
              width: 120,
              height: 80,
              color: Colors.red,
            ),
            Container(
              width: 40,
              height: 20,
              color: Colors.blue,
            ),
            Container(
              width: 70,
              height: 120,
              color: Colors.yellow,
            )
          ],
        ),

        Divider(
          height: 1, // 分割线高度（包含上下间距）
          thickness: 1, // 分割线本身的厚度
          color: Colors.grey, // 分割线颜色
        ),

      ]
    );

  }
}


class YZHomeWidgetContent extends StatefulWidget {
  const YZHomeWidgetContent({super.key});

  @override
  State<YZHomeWidgetContent> createState() => _YZHomeWidgetContentState();
}

class _YZHomeWidgetContentState extends State<YZHomeWidgetContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 50, height: 50, color: Colors.red),
        // 剩余空间按 1:2 分配给两个 Flexible
        Flexible(
          flex: 1,
          fit: FlexFit.loose, // 默认，不强制填满
          child: Container(height: 50, color: Colors.green),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight, // 强制填满分配的空间
          child: Container(height: 50, color: Colors.blue),
        ),
      ],
    );
  }
}

class YZHomeStackContent extends StatefulWidget {
  const YZHomeStackContent({super.key});

  @override
  State<YZHomeStackContent> createState() => _YZHomeStackContentState();
}

class _YZHomeStackContentState extends State<YZHomeStackContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,//默认左上角
      // fit: StackFit.expand,//将所以子元素拉伸最大化
      children: [
        Image(image: AssetImage("assets/images/1211.png"), height: 500,),
        Container(
          height: 200,
          width: 200,
          color: Colors.greenAccent,
        ),
        Positioned(
            right: 10,
            bottom: 10,
            child:Text("这是一个标题描述")
        )

      ],
    );
  }
}

