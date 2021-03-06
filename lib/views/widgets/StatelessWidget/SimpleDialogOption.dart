import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwidgets/views/dialogs/dialog_about.dart';


/// create by 小官在江湖 on 2020-03-25
/// contact me by email 1981462002@qq.com
/// 说明:
//    {
//      "widgetId": 133,
//      "name": 'SimpleDialogOption基本使用',
//      "priority": 1,
//      "subtitle":
//          "【child】 : 子组件   【Widget】\n"
//          "【onPressed】 : 点击事件  【Function()】",
//    }
class CustomSimpleDialogOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.all(5),
          color: Colors.grey.withAlpha(33),
          child: SimpleDialogOption(
              onPressed: () => DialogAbout.show(context),
              child: Text('小官在江湖')),
        ),
        Container(
          height: 50,
          alignment: Alignment.center,
          width: double.infinity,
          color: Colors.grey.withAlpha(33),
          margin: EdgeInsets.all(5),
          child: SimpleDialogOption(
              onPressed: () => DialogAbout.show(context),
              child: Text('百里·巫缨')),
        ),
      ],
    );
  }
}
