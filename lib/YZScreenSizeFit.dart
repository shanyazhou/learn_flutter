import 'dart:ui';

import 'package:flutter/material.dart';

class YZScreenSizefit {

  static double? physicalWidth;
  static double? physicalHeight;
  static double? screenWidth;
  static double? screenHeight;
  static double? statusHeight;

  static double? rpx;
  static double? px;

  /// 初始化
  static void initialize({ double standardSize = 750 }) {
    /// 手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;
    print("分辨率：$physicalWidth * $physicalHeight");

    // 获取dpr
    final dpr = window.devicePixelRatio;

    // 手机屏幕的大小
    screenWidth = physicalWidth! / dpr;
    screenHeight = physicalHeight! / dpr;
    print("手机屏幕大小：$screenWidth * $screenHeight");

    statusHeight = window.padding.top / dpr;
    print("状态栏的高度：$statusHeight");

    // 计算rpx的大小
    rpx = screenWidth! / standardSize;
    px = screenWidth! / standardSize * 2;
  }

  static double setRpx(double size) {
    return rpx! * size;
  }

  static double setPx(double size) {
    return px! * size;
  }
}