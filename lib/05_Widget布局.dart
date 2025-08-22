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
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        children: [
          YZHomeTextContent(),
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

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      // 1. 消除 Column 子组件之间的默认垂直间距
      //mainAxisSize: MainAxisSize.min, // 让 Column 仅占用子组件所需空间
      children: [
        TextButton(
          onPressed: (){
            
          }, 
          child:Text("TextButton1"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
            // 去除按钮的外边距（默认可能存在微小外边距，这里确保彻底清除）
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),

        ),

        TextButton(
          onPressed: (){

          },
          child:Text("TextButton2"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
            // 去除按钮的外边距（默认可能存在微小外边距，这里确保彻底清除）
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),

        /// 没有文字的按钮，不显示
        TextButton(
          onPressed: (){

          },
          child:Text(""),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
            // 去除按钮的外边距（默认可能存在微小外边距，这里确保彻底清除）
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,

            /// 下面两个属性设置，将没有文字的按钮大小，设置为0
            // 移除最小宽度和高度
            minimumSize: MaterialStateProperty.all(Size.zero),
            // 移除内边距
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
        ),

        /// 占位图
        FadeInImage(
          placeholder:AssetImage("assets/images/1211.png"),
          image: NetworkImage("https://profile-avatar.csdnimg.cn/6048fbe7bbe8476182ccb4e1364f988f_iosshan.jpg!1"),
        ),

        /// Icon
        Icon(
          Icons.pets,
          color: Colors.lightGreen,
          size: 120,
          shadows: [
            Shadow(
                color: Colors.black26,
                offset: Offset(5, 5)
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.all(10),
          ///TextField
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.face),
                iconColor: Colors.greenAccent,
                labelText: "请输入内容：",
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1))
            ),
            onChanged: (value) {
                print("输入内容: $value");
            },
            onSubmitted: (value) {
              print("提交内容: $value");
            },
            controller: usernameController,
          ),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          ///TextField
          child: TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  iconColor: Colors.greenAccent.withOpacity(0.8),
                  labelText: "请输入密码：",
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1))
              ),
              controller: passwordController,
          ),
        ),

        Container(
            width: 320,
            height: 44,
            child: TextButton(
              onPressed: (){
                final username = usernameController.text;
                final password = passwordController.text;
                print("账户：$username, 密码：$password");
              },
              child: Text("登 录", style: TextStyle(color: Colors.white),),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
            )
        )


      ],
    );
  }
}
