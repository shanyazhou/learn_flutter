import 'package:flutter/material.dart';
import 'package:learn_flutter/02_tableView.dart';
import 'package:learn_flutter/Route/YZHomeAboutView.dart';
import '01_HelloWorld_01.dart' as HelloWorld;
import '02_tableView.dart' as tableView;
import '03_PlusAndMinus.dart' as PlusAndMinus;


void main(){
  //调用runApp函数
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//保持整个app是Material风格
        debugShowCheckedModeBanner: false,//去掉右上角的debug
        home: YZStartListPage(),
        routes: {
          HelloWorld.YZHomePage.routeName: (BuildContext context){
            return HelloWorld.YZHomePage();
          },

          tableView.YZHomePage.routeName: (BuildContext context){
            return tableView.YZHomePage();
          },

          PlusAndMinus.YZHomePage.routeName: (BuildContext context){
            return PlusAndMinus.YZHomePage();
          },

          Yzhomeaboutview.routeName: (BuildContext context){
            return Yzhomeaboutview(message: "123",);
          },
        },
    );
  }
}

class YZStartListPage extends StatelessWidget {
  const YZStartListPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("演示列表"),
        backgroundColor: Colors.amber,
      ),
      body: YZStartListContent(),

      
    );
  }
}

class YZStartListContent extends StatelessWidget {

  final titleArray = ["HelloWorld", "tableView", "PlusAndMinus", ];

  YZStartListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titleArray.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text("$index ${titleArray[index]}"),
          onTap: (){
            _navigateToDetail(context, index);
          },
        );
      }
    );
  }

  void _navigateToDetail(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed("/01_HelloWorld_01");
        break;
      case 1:
        Navigator.of(context).pushNamed("/02_tableView");
        break;
      case 2:
        Navigator.of(context).pushNamed("/03_PlusAndMinus");
        break;
      default:
        Navigator.of(context).pushNamed("/about", arguments: "123");
    }
  }
}
