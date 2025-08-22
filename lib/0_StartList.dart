import 'package:flutter/material.dart';
// import 'package:learn_flutter/02_tableView.dart'; // unused, use aliased relative import instead
import 'package:learn_flutter/Route/YZHomeAboutView.dart';
import '01_HelloWorld_01.dart' as HelloWorld;
import '02_tableView.dart' as tableView;
import '03_PlusAndMinus.dart' as PlusAndMinus;
import '04_BaseWidget.dart' as BaseWidget04;
import '05_Widget布局.dart' as Widget05;
import '06_Widget布局2.dart' as Widget06;
import '07_Widget布局3.dart' as Widget07;
import '08_滚动Widget.dart' as Scroll08;
import '09_GridView.dart' as Grid09;
import '10_CustomScrollView.dart' as CSV10;
import '11_CustomScrollView2.dart' as CSV11;
import '12_CustomScrollView3.dart' as CSV12;
import '13_异步线程的学习.dart' as Async13;
import '14_key的介绍.dart' as Key14;
import '15_key的介绍2.dart' as Key15;
import '16_InheritedWidget使用.dart' as Inherited16;
import '17_provider使用.dart' as Provider17;
import '18_事件.dart' as Event18;
import '19_事件传递.dart' as Event19;
import '20_Theme.dart' as Theme20;
import '21_ScreenFit.dart' as ScreenFit21;
import 'Animation/main.dart' as AnimMain;
import 'Animation/hero_learn.dart' as AnimHero;
import 'Animation/multiAnimation.dart' as AnimMulti;
import 'Route/main.dart' as RouteDemo;
import 'douban/pages/main/main.dart' as Douban;

import 'package:provider/provider.dart';
import 'YZScreenSizeFit.dart';


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

  final titleArray = [
    "01 HelloWorld",
    "02 tableView",
    "03 PlusAndMinus",
    "04 基础组件",
    "05 布局一",
    "06 布局二",
    "07 布局三",
    "08 滚动Widget",
    "09 GridView",
    "10 CustomScrollView",
    "11 CustomScrollView2",
    "12 CustomScrollView3",
    "13 异步线程的学习",
    "14 key 的介绍",
    "15 key 的介绍2",
    "16 InheritedWidget 使用",
    "17 provider 使用",
    "18 事件",
    "19 事件传递",
    "20 Theme",
    "21 ScreenFit",
    "22 Animation - 主页面",
    "23 Animation - Hero",
    "24 Animation - MultiAnimation",
    "25 Route - Demo",
    "26 豆瓣 - Main",
    "27 About 页面",
  ];

  YZStartListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titleArray.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          leading: Icon(Icons.add_call),
          title: Text("${titleArray[index]}"),
          tileColor: Colors.lightGreenAccent.withOpacity(0.1),
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
      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return BaseWidget04.YZHomePage();
        }));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Widget05.YZHomePage();
        }));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Widget06.YZHomePage();
        }));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Widget07.YZHomePage();
        }));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Scroll08.YZHomePage();
        }));
        break;
      case 8:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Grid09.YZHomePage();
        }));
        break;
      case 9:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return CSV10.YZHomePage();
        }));
        break;
      case 10:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return CSV11.YZHomePage();
        }));
        break;
      case 11:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return CSV12.YZHomePage();
        }));
        break;
      case 12:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Async13.YZHomePage();
        }));
        break;
      case 13:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Key14.YZHomePage();
        }));
        break;
      case 14:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Key15.YZHomePage();
        }));
        break;
      case 15:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Inherited16.YZHomePage();
        }));
        break;
      case 16:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => Provider17.YZCounterViewModel()),
            ],
            child: Provider17.YZHomePage(),
          );
        }));
        break;
      case 17:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Event18.YZHomePage();
        }));
        break;
      case 18:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Event19.YZHomePage();
        }));
        break;
      case 19:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Theme20.YZHomePage();
        }));
        break;
      case 20:
        YZScreenSizefit.initialize();
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return ScreenFit21.YZHomePage();
        }));
        break;
      case 21:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return AnimMain.YZHomePage();
        }));
        break;
      case 22:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return AnimHero.YZHomePage();
        }));
        break;
      case 23:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return AnimMulti.YZHomePage();
        }));
        break;
      case 24:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return RouteDemo.YZHomePage();
        }));
        break;
      case 25:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Douban.YZMainPage();
        }));
        break;
      case 26:
        Navigator.of(context).pushNamed("/about", arguments: "123");
        break;
      default:
        Navigator.of(context).pushNamed("/about", arguments: "123");
    }
  }
}
