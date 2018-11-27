import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ProfileAppBar extends StatelessWidget {

  final Widget title;
  final Widget leading;
  final Widget actions;

  ProfileAppBar({@required this.title, this.leading = const SizedBox(width: 40.0,), this.actions = const SizedBox(width: 40.0,)});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0, bottom: 8.0),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                leading,
                title,
                actions
              ],
            ),
          ],
        ),
      ),
    );
  }
}
