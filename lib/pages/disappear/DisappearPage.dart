import "package:flutter/material.dart";
import 'package:xiaofaner/config/appConfig.dart';

class DisappearPage extends StatefulWidget {
  DisappearPage({Key key}) : super(key: key);

  @override
  _DisappearPageState createState() => new _DisappearPageState();
}

class _DisappearPageState extends State<DisappearPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    final controller = new TabController(
      vsync: this,
      length: 2
    );
   
    return new CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 0.0,
          forceElevated: true,
          pinned: true,
          floating: true,
          title: new Text(AppConfig.disappearTitle),
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 50.0),
            child: Container(
              color: Colors.black,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white,
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TabBar(
                    controller: controller,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600,),
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: <Widget>[
                      Tab(text: '精选',),
                      Tab(text: '活动',)
                    ],
                  ),
                ),
              )
            )
          ),
        ),
        new SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}