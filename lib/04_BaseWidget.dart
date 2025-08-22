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
        title: Text("基础组件"),
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        children: [
          YZHomeTextContent(),
          SizedBox(height: 50),
          YZHomeButtonContent(),
          SizedBox(height: 50),
          YZHomeImageContent()
        ],
      ),
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
        Text(
          "黄色的树林里分出两条路，可惜我不能同时去涉足，我在那路口久久伫立，我向着一条路极目望去，直到它消失在丛林深处",
          textAlign: TextAlign.center,
          maxLines: 3,///最大行数
          overflow: TextOverflow.ellipsis,///如果被省略了，省略号结束
          textScaleFactor: 1.2,///缩放因子
          style: TextStyle(
              fontSize: 25,
              color: Colors.yellow,
              fontWeight: FontWeight.bold
          ),
        ),

        /// 符文本
        Text.rich(
            TextSpan(
              text: "Hello OC",
              style: TextStyle(color: Colors.green, fontSize: 28),
            )
        ),

        Text.rich(
            TextSpan(
              /// 符文本有多个
              children: [
                TextSpan(
                  text: "Hello Swift",
                  style: TextStyle(color: Colors.yellow, fontSize: 15),
                ),
                TextSpan(
                  text: "Hello SwiftUI",
                  style: TextStyle(color: Colors.pink, fontSize: 15),
                ),
                WidgetSpan(child: Icon(Icons.face, color: Colors.lightBlueAccent,)),
                TextSpan(
                  text: "Hello Flutter",
                  style: TextStyle(color: Colors.purple, fontSize: 15),
                ),
              ],

            )
        ),
      ],
    );
  }
}


class YZHomeButtonContent extends StatefulWidget {
  const YZHomeButtonContent({super.key});

  @override
  State<YZHomeButtonContent> createState() => _YZHomeButtonContentState();
}

class _YZHomeButtonContentState extends State<YZHomeButtonContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: (){
            print("ElevatedButton");
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
          child: Text("ElevatedButton", style: TextStyle(color: Colors.red)),
        ),
        TextButton(
            onPressed: (){
              print("TextButton");
            },
            child: Text("TextButton")
        ),
        OutlinedButton(
            onPressed: (){
              print("OutlinedButton");
            },
            child: Text("OutlinedButton")
        ),

        ///自定义按钮
        TextButton(
            onPressed: (){
              print("TextButton");
            },
            child: Row(
              /// 默认是占宽度全屏，加上下面这句，就占本身大小
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite),
                Text("I Love You！")
              ],
            ),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.cyan)),
        ),
      ],
    );
  }
}

class YZHomeImageContent extends StatefulWidget {
  const YZHomeImageContent({super.key});

  @override
  State<YZHomeImageContent> createState() => _YZHomeImageContentState();
}

class _YZHomeImageContentState extends State<YZHomeImageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 网络图片
        Image(image: NetworkImage("https://profile-avatar.csdnimg.cn/6048fbe7bbe8476182ccb4e1364f988f_iosshan.jpg!1")),
        
        // 本地图片 - 添加错误处理
        Image.asset(
          color: Colors.red,
          colorBlendMode: BlendMode.colorBurn,
          "assets/images/1211.png",
          width: 200,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 200,
              height: 100,
              color: Colors.grey[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red),
                  Text("图片加载失败", style: TextStyle(color: Colors.red)),
                  Text("请检查 assets/images/1211.png 是否存在", style: TextStyle(fontSize: 12)),
                ],
              ),
            );
          },
        ),
        
        // 使用 AssetImage 的方式
        Image(
          color: Colors.yellow,
          colorBlendMode: BlendMode.difference,
          image: AssetImage("assets/images/1211.png"),
          width: 200,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 200,
              height: 100,
              color: Colors.grey[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red),
                  Text("AssetImage 加载失败", style: TextStyle(color: Colors.red)),
                  Text("错误: $error", style: TextStyle(fontSize: 10)),
                ],
              ),
            );
          },
        ),
        
        /// 占位图
        FadeInImage(
          placeholder:AssetImage("assets/images/1211.png"),
          image: NetworkImage("https://profile-avatar.csdnimg.cn/6048fbe7bbe8476182ccb4e1364f988f_iosshan.jpg!1"),
        )
      ],
    );
  }
}
