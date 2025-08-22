import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/pages/main/bottom_bar_item.dart';
import 'package:learn_flutter/douban/pages/home/home.dart';
import 'package:learn_flutter/douban/pages/mine/mine.dart';
import 'package:learn_flutter/douban/pages/rank/rank.dart';

class YZMainPage extends StatefulWidget {
  const YZMainPage({super.key});

  @override
  State<YZMainPage> createState() => _YZMainPageState();
}

class _YZMainPageState extends State<YZMainPage> {

  var _selctedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selctedIndex,
          children: [
            YZHomePage(),
            YZMinePage(),
            YZRankPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,//当item大于或 等于4个的时候，文字会被隐藏。加上这个，就不隐藏了
          selectedFontSize: 14,
          unselectedFontSize: 14,//设置字体大小一样
          items: [
            // BottomNavigationBarItem(
            //     icon: Image.asset("assets/images/home_unselected.png", width: 30,),
            //     activeIcon: Image.asset("assets/images/home_selected.png", width: 30,),
            //     label: "首页"
            // ),
            YZBottomBarItem("home", "首页"),
            YZBottomBarItem("rank", "榜单"),
            YZBottomBarItem("mine", "我的")
          ],
          currentIndex: _selctedIndex,
          onTap: (index){
            setState(() {
              _selctedIndex = index;
            });
          },
        ),
    );
  }
}

