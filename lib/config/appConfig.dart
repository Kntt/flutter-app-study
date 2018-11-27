import 'package:flutter/material.dart';
import 'package:xiaofaner/widgets/AppIcon.dart';
class AppConfig {
  // 主题
  static ThemeData themeData = new ThemeData(
    platform: TargetPlatform.iOS,
    primaryColor: Color(0xFF3F86F5),
    accentColor: Color(0xFF2671E6),
    errorColor: Color(0xFFF15F56),
    bottomAppBarColor: Color(0xFFB9CAD2),
  );

  static List tabIcons = [
    [
      new Icon(AppIcons.home),
      new Icon(AppIcons.home_active),
    ],
    [
      new Icon(AppIcons.message),
      new Icon(AppIcons.message_active),
    ],
    [
      new Icon(AppIcons.disappear),
      new Icon(AppIcons.disappear_active),
    ],
    [
      new Icon(AppIcons.person),
      new Icon(AppIcons.person_active),
    ],
  ];

  // 颜色
  static Color bgColor = Color(0xFFF5F5F5);
  static Color borderColor = Color(0xFFEAEAEA);
  static Color titleColor = Color(0xFF1E1E1E);
  static Color textColor = Color(0xFF888888);
  static Color disableColor = Color(0xFFBBBBBB);

  // title
  static String appName = 'kntter';
  static String homeTitle = '首页';
  static String messageTitle = '消息';
  static String disappearTitle = '发现';
  static String userTitle = '我的';
}