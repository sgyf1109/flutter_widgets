import 'package:flutter/material.dart';

/// create by 小官在江湖 on 2020-03-22
/// contact me by email 1981462002@qq.com
/// 说明:

//    {
//      "widgetId": 108,
//      "name": 'Positioned基本使用',
//      "priority": 2,
//      "subtitle":
//          "【child】 : 组件   【Widget】\n"
//          "【top】 : 到父顶距离   【double】\n"
//          "【right】 : 到父右距离   【double】\n"
//          "【left】 : 到父左距离   【double】\n"
//          "【bottom】 : 到父底距离   【double】",
//    }
class CustomPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var yellowBox = Container(
      color: Colors.yellow,
      height: 100,
      width: 100,
    );

    var redBox = Container(
      color: Colors.red,
      height: 90,
      width: 90,
    );

    var greenBox = Container(
      color: Colors.green,
      height: 80,
      width: 80,
    );

    var cyanBox = Container(
      color: Colors.cyanAccent,
      height: 70,
      width: 70,
    );

    return Container(
        width: 200,
        height: 120,
        color: Colors.grey.withAlpha(33),
        child: Stack(
          children: <Widget>[
            yellowBox,
            redBox,
            Positioned(top: 20, left: 20, child: greenBox),
            Positioned(
              child: cyanBox,
              bottom: 10,
              right: 10,
            )
          ],
        ));
  }
}
