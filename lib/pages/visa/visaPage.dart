import 'package:flutter/material.dart';

class VisaPage extends StatefulWidget {

  @override
    State<StatefulWidget> createState() => new _VisaPageState();
}

class _VisaPageState extends State<VisaPage> {

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('打卡'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Center(
            child: Text('VISA'),
          ),
        ),
      );
    }
}