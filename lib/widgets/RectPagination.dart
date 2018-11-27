import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class RectPagination extends SwiperPlugin {

  final Key key;
  final Color activeColor;
  final Color color;

  const RectPagination({this.key, this.activeColor, this.color});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    
    List<Widget> list = [];

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    Color activeColor = this.activeColor ?? Theme.of(context).primaryColor;
    Color color = this.color ?? Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4);

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      Size size = Size(5.0, 5.0);
      list.add(Container(
        width: size.width,
        height: size.height,
        key: Key("pagination_$i"),
        color: active ? activeColor : color,
        margin: EdgeInsets.only(left: 2.0, right: 2.0),
      ));
    }

    if (config.scrollDirection == Axis.vertical) {
      return new Column(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    } else {
      return new Row(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    }
  }
}