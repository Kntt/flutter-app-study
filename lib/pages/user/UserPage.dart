import "package:flutter/material.dart";
import 'package:xiaofaner/config/appConfig.dart';
import 'package:xiaofaner/widgets/AppIcon.dart';

class ClipperOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, 6.0);

    path.lineTo(0.0, size.height - 26.0);

    var firstControlPoint = new Offset(size.width, size.height - 26.0);
    var firstPoint = new Offset(size.width, 0.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    path.lineTo(6.0, 0.0);

    var secondControlPoint = new Offset(0.0, 0.0);
    var secondPoint = new Offset(0.0, 6.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
class ClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.moveTo(size.width - 102.0, size.height);

    path.lineTo(size.width - 6.0, size.height);

    var firstControlPoint = new Offset(size.width, size.height);
    var firstPoint = new Offset(size.width, size.height - 6.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    path.lineTo(size.width, size.height - 102.0);

    var secondControlPoint = new Offset(size.width - 102.0, size.height - 102.0);
    var secondPoint = new Offset(size.width - 102.0, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => new _UserPageState();
}

class _UserPageState extends State<UserPage> {

  Widget userCard () => Container(
    height: 184.0,
    child: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color(0xFF0071EF),
            boxShadow: <BoxShadow>[
              new BoxShadow (
                color: const Color(0xFF0071EF),
                offset: new Offset(0.0, 16.0),
                blurRadius: 24.0,
                spreadRadius: -16.0
              ),
            ]
          ),
        ),
        Row(
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: new ClipPath(
                clipper: new ClipperOne(),
                child: Container(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFF0071EF),
                        Color(0xFF2688F6),
                      ],
                    )
                  ),
                  height: 184.0,
                ),
              ),
            ),
            new Expanded(
              flex: 1,
              child: new ClipPath(
                clipper: new ClipperTwo(),
                child: Container(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF0071EF),
                        Color(0xFF2688F6),
                      ],
                    )
                  ),
                  height: 184.0,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: ClipOval(
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/icon-loading.webp',
                              fit: BoxFit.fill,
                              image: 'https://i0.wp.com/p3.pstatp.com/large/1780000cbbeef53c9455',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Column(
                        children: <Widget>[
                          Text('Kntt', style: TextStyle(color: Colors.white, fontSize: 20.0, ), textAlign: TextAlign.left,),
                          Text('1001000', style: TextStyle(color: Colors.white, fontSize: 16.0, ), textAlign: TextAlign.left,)
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 32.0,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(width: 2.0, color: Colors.white),
                      color: Color(0xFF0071EF),
                    ),
                    child: Center(
                      child: Text('入职1024天', style: TextStyle(fontSize: 14.0, color: Colors.white),),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 36.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('部门', style: TextStyle(fontSize: 16.0, color: Colors.white),),
                  SizedBox(
                    width: 1.0,
                    height: 16.0,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Text('业务线', style: TextStyle(fontSize: 16.0, color: Colors.white)),
                  SizedBox(
                    width: 1.0,
                    height: 16.0,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Text('前端工程师', style: TextStyle(fontSize: 16.0, color: Colors.white)),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );

  Widget settingList () => Column(
    children: <Widget>[
      SizedBox(
        height: 24.0,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0)
        ),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 20.0, right: 12.0),
          leading: Icon(
            AppIcons.finup,
            color: Color(0xFF1B86FD),
          ),
          title: Text('我的故事', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
          trailing: Icon(AppIcons.arrow_right, size: 16.0),
          onTap: () { print('我的故事'); },
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.only(left: 20.0, right: 12.0),
              leading: Icon(
                AppIcons.help,
                color: Color(0xFFFF514E),
              ),
              title: Text('帮助中心', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
              trailing: Icon(AppIcons.arrow_right, size: 16.0),
              onTap: () { print('帮助中心'); },
            ),
            Divider(height: 0.0,),
            ListTile(
              contentPadding: EdgeInsets.only(left: 20.0, right: 12.0),
              leading: Icon(
                AppIcons.feedback,
                color: Color(0xFF00C14C),
              ),
              title: Text('意见反馈', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
              trailing: Icon(AppIcons.arrow_right, size: 16.0),
              onTap: () { print('意见反馈'); },
            ),
          ],
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 20.0, right: 12.0),
          leading: Icon(
            AppIcons.setting,
            color: Color(0xFFFF9500),
          ),
          title: Text('设置', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
          trailing: Icon(AppIcons.arrow_right, size: 16.0),
          onTap: () { print('设置'); },
        ),
      ),
      
    ],
  );

  @override
  Widget build(BuildContext context) {
    // var deviceSize = MediaQuery.of(context).size;
    return new Scaffold(
      backgroundColor: AppConfig.bgColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppConfig.bgColor,
        title: new Text(AppConfig.userTitle, style: TextStyle(color: AppConfig.titleColor),),
        brightness: Brightness.light,
        actions: <Widget>[
          new IconButton(
            iconSize: 18.0,
            color: AppConfig.titleColor,
            icon: new Icon(AppIcons.edit),
            tooltip: '编辑',
            onPressed: () { print('edit'); },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              userCard(),
              settingList()
            ],
          ),
        ),
      ),
    );
  }
}