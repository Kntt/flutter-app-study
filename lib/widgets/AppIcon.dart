import 'package:flutter/widgets.dart';

class AppIconData extends IconData {
  const AppIconData(int codePoint)
    :super(
      codePoint,
      fontFamily: 'IconFont',
    );
}

class AppIcons {
  static const IconData home = const AppIconData(0xe612);
  static const IconData home_active = const AppIconData(0xe618);
  static const IconData message = const AppIconData(0xe616);
  static const IconData message_active = const AppIconData(0xe617);
  static const IconData disappear = const AppIconData(0xe615);
  static const IconData disappear_active = const AppIconData(0xe613);
  static const IconData person = const AppIconData(0xe619);
  static const IconData person_active = const AppIconData(0xe614);
  static const IconData scan = const AppIconData(0xe61b);
  static const IconData edit = const AppIconData(0xe61a);
  static const IconData finup = const AppIconData(0xe61f);
  static const IconData setting = const AppIconData(0xe61e);
  static const IconData help = const AppIconData(0xe61d);
  static const IconData feedback = const AppIconData(0xe61c);
  static const IconData arrow_left = const AppIconData(0xe620);
  static const IconData arrow_down = const AppIconData(0xe621);
  static const IconData arrow_right = const AppIconData(0xe622);
  static const IconData arrow_up = const AppIconData(0xe623);
}