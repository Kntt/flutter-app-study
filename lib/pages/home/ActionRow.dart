import 'package:flutter/material.dart';
import 'package:xiaofaner/config/appConfig.dart';
import 'package:xiaofaner/route/application.dart';

class ActionRow extends StatelessWidget {
  final List actions;
  
  static const imageSize = 46.0;

  const ActionRow({Key key, this.actions})
      : super(key: key);

  static List<Widget> generateActions (List actions, BuildContext context) {
    List<Widget> children = [];
    for (var i = 0; i < actions.length; i++) {
      var action = actions[i];
      var path = action['path'];
      children.add(new InkWell(
        onTap: () { Application.router.navigateTo(context, path); },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(action['icon']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(imageSize/2),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              action['label'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, color: AppConfig.titleColor),
            )
          ],
        ),
      ));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: generateActions(actions, context),
      ),
    );
  }
}
