library xiaofan.app;

import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:fluro/fluro.dart';
import 'package:xiaofaner/route/application.dart';
import 'package:xiaofaner/route/routers.dart';
import 'package:xiaofaner/config/appConfig.dart';
import 'package:xiaofaner/redux/app_state.dart';
import 'package:xiaofaner/redux/store.dart';
import 'home/HomePage.dart';
import 'message/MessagePage.dart';
import 'disappear/DisappearPage.dart';
import 'user/UserPage.dart';


class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Column(
          children: [
            new Center(
              child: new FlutterLogo(
                colors: Colors.pink,
                size: 80.0
              )
            ),
            new Center(
              child: new Text(AppConfig.appName, style: new TextStyle(fontSize: 32.0))
            ),
            new Center(
              child: new Text("Flutter", style: new TextStyle(fontSize: 16.0))
            )
          ], 
          mainAxisAlignment: MainAxisAlignment.center
        )
      )
    );
  }
}

class ApplicationPage extends StatefulWidget {

  ApplicationPage(this.store);

  final Store<AppState> store;

  @override
  State<StatefulWidget> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> with SingleTickerProviderStateMixin {

  _ApplicationPageState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  int page = 0;

  String title = AppConfig.homeTitle;

  PageController pageController;

  //定义底部导航项目
  List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[];

  Icon getTabIcon (int curPage) {
    if (curPage == page) {
      return AppConfig.tabIcons[curPage][1];
    }
    return AppConfig.tabIcons[curPage][0];
  }

  void initData () {
    _bottomTabs = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
          icon: getTabIcon(0),
          title: new Container(),
          backgroundColor: Colors.lightBlue),
      new BottomNavigationBarItem(
          icon: getTabIcon(1),
          title: new Container(),
          backgroundColor: Colors.lightBlue),
      new BottomNavigationBarItem(
          icon: getTabIcon(2),
          title: new Container(),
          backgroundColor: Colors.lightBlue),
      new BottomNavigationBarItem(
          icon: getTabIcon(3),
          title: new Container(),
          backgroundColor: Colors.lightBlue),
    ];
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initData();
    final app = MaterialApp(
      theme: AppConfig.themeData,
      home: Scaffold(
        body: new PageView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[HomePage(), MessagePage(), DisappearPage(), UserPage()],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: new CupertinoTabBar(
          items: _bottomTabs,
          currentIndex: page,
          activeColor: AppConfig.themeData.primaryColor,
          iconSize: 24.0,
          onTap: onTap
        ),
      ),
      onGenerateRoute: Application.router.generator,
    );
    print("initial route = ${app.initialRoute}");
    return app;
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
      switch (page) {
        case 0:
          title = AppConfig.homeTitle;
          break;
        case 1:
          title = AppConfig.messageTitle;
          break;
        case 2:
          title = AppConfig.disappearTitle;
          break;
        case 3:
          title = AppConfig.userTitle;
          break;
      }
    });
  }
}

Future<Null>run () async {
  runApp(new Splash());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  await Future.delayed(Duration(seconds: 4));
  var store = await createStore();
  runApp(new ApplicationPage(store));
}
