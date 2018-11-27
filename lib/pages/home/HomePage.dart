import "package:flutter/material.dart";
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xiaofaner/config/appConfig.dart';
import 'package:xiaofaner/widgets/LoginBackground.dart';
import 'package:xiaofaner/widgets/RectPagination.dart';
import 'package:xiaofaner/widgets/AppIcon.dart';
import './ActionRow.dart';

import 'package:xiaofaner/route/application.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List actions = [
    {
      'icon': 'assets/daka.png',
      'label': "打卡",
      'path': '/visa'
    },
    {
      'icon': 'assets/huiyizhushou.png',
      'label': "会议助手",
      'path': '/huiyizhushou'
    },
    {
      'icon': 'assets/shenpizhongxin.png',
      'label': "审批中心",
      'path': '/approval'
    },
    {
      'icon': 'assets/guanaitong.png',
      'label': "关爱通",
      'path': '/guanaitong'
    },
  ];

  List banners = [
    {
      'image': 'https://m.360buyimg.com/mobilecms/s1125x690_jfs/t20029/272/1765431541/135543/fbf22a8b/5b25a7d0Ncdb4f0f3.jpg!cr_1125x549_0_72!q70.jpg.dpg',
      'path': 'banner1'
    },
    {
      'image': 'https://m.360buyimg.com/mobilecms/s1125x690_jfs/t1/2100/2/2347/412518/5b964188E3900f602/48439219c678bf0e.jpg!cr_1125x549_0_72!q70.jpg.dpg',
      'path': 'banner2'
    },
    {
      'image': 'https://m.360buyimg.com/mobilecms/jfs/t26329/169/320960659/99429/25aefdc3/5b8e429eN68bd522e.jpg!cr_1125x549_0_72',
      'path': 'banner3'
    },
    {
      'image': 'https://m.360buyimg.com/mobilecms/s1125x690_jfs/t1/2146/13/2744/241181/5b975cf6Ef5106fed/223ee149f5b14caf.jpg!cr_1125x549_0_72!q70.jpg.dpg',
      'path': 'banner4'
    },
    {
      'image': 'https://m.360buyimg.com/mobilecms/s1125x690_jfs/t1/3075/2/615/178920/5b923299Ed0c2fc0f/af98e2e4780b84c3.jpg!cr_1125x549_0_72!q70.jpg.dpg',
      'path': 'banner5'
    },
  ];

  Widget appBarColumn (BuildContext context) => AppBar(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    title: new Text(AppConfig.homeTitle),
    actions: <Widget>[
      new IconButton(
        iconSize: 18.0,
        icon: new Icon(AppIcons.scan),
        tooltip: '扫一扫',
        onPressed: () { 
          Application.router.navigateTo(context, '/scaner');
        },
      )
    ],
  );

  Widget swiperCard() => Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: new Container(
      height: 120.0,
      child: new Swiper(
        itemBuilder: (BuildContext context,int index){
          return Container(
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                color: AppConfig.bgColor,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/image-loading.webp',
                  fit: BoxFit.fill,
                  image: banners[index]['image'],
                ),
              ),
            ),
          );
        },
        onTap: (int index) {
          var path = banners[index]['path'];
          print('banner tap path: $path');
        },
        itemCount: banners.length,
        autoplay: true,
        autoplayDelay: 5000,
        duration: 500,
        viewportFraction: 0.85,
        scale: 0.9,
        pagination: new SwiperPagination(
          // alignment: Alignment(4.0, 4.0),
          builder: RectPagination()
        ),
      ),
    ),
  );

  Widget actionsCard () => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Card(
      elevation: 0.2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ActionRow(actions: actions),
              ActionRow(actions: actions),
              ActionRow(actions: actions),
              ActionRow(actions: actions),
              ActionRow(actions: actions),
            ],
          ),
        ),
      )
    ),
  );

  Widget allCards(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: <Widget>[
        appBarColumn(context),
        swiperCard(),
        actionsCard(),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.bgColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          LoginBackground(
            showIcon: false,
          ),
          allCards(context),
        ],
      ),
    );
  }
}