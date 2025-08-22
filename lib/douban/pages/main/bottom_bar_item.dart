import 'package:flutter/material.dart';

class YZBottomBarItem extends BottomNavigationBarItem {
  YZBottomBarItem(String iconName, String title): super(
      icon: Image.asset("assets/images/${iconName}_unselected.png", width: 30,),
      activeIcon: Image.asset("assets/images/${iconName}_selected.png", width: 30,),
      label: title
  );
}