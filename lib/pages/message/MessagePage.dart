import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:xiaofaner/config/appConfig.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => new _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  final SlidableController slidableController = new SlidableController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: new Text(AppConfig.messageTitle),
      ),
      backgroundColor: Colors.white,
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new Slidable(
              key: new Key('Message_$index'),
              controller: slidableController,
              delegate: new SlidableBehindDelegate(),
              actionExtentRatio: 0.2,
              child: InkWell(
                child: new Container(
                  margin: EdgeInsets.only(
                    left: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: new BorderSide(width: 1.0, color: AppConfig.borderColor)),
                  ),
                  child: new ListTile(
                    contentPadding: EdgeInsets.only(left: 0.0, right: 12.0),
                    leading: new CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.indigoAccent,
                      child: new Text('$index'),
                      foregroundColor: Colors.white,
                    ),
                    title: new Text('Message item $index'),
                    subtitle: new Text('Message description $index'),
                    trailing: new Text('12:00:00'),
                  ),
                ),
                onTap: () { print('Tab Message $index'); },
              ),
              secondaryActions: <Widget>[
                new IconSlideAction(
                  caption: '删除',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoActionSheet(
                          title: new Text('确认删除吗?', style: TextStyle(fontSize: 18.0, color: AppConfig.titleColor, fontWeight: FontWeight.w500),),
                          actions: <Widget>[
                            CupertinoActionSheetAction(
                              isDestructiveAction: true,
                              child: new Text('删除', style: TextStyle(fontSize: 18.0, color: AppConfig.themeData.errorColor,)),
                              onPressed: () {
                                print('Delete Message $index');
                              },
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            // isDefaultAction: true,
                            child: new Text('取消', style: TextStyle(fontSize: 18.0, color: AppConfig.textColor),),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                      }
                    );
                  },
                ),
              ],
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}