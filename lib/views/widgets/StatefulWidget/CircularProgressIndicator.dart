import 'package:flutter/material.dart';
//    {
//      "widgetId": 46,
//      "name": 'CircularProgressIndicator基本使用',
//      "priority": 1,
//      "subtitle":
//          "【value】 : 进度   【double】\n"
//          "【backgroundColor】 : 背景色   【Color】\n"
//          "【valueColor】 : 进度颜色   【Animation<Color>】\n"
//          "【strokeWidth】 : 线宽   【double】",
//    }
class CustomCircularProgressIndicator extends StatefulWidget {
  @override
  _CustomCircularProgressIndicatorState createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator> {

  var data = <double>[0.2,0.4,0.6,0.8,null];

  @override
  Widget build(BuildContext context) {

    return Wrap(
      spacing: 10,
      children:data.map((e)=>Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          value: e,
          backgroundColor: Colors.grey.withAlpha(33),
          //想对进度条应用一种固定的颜色，此时可以通过AlwaysStoppedAnimation来指定。
          // 变化的可以用ColorTween(begin: Colors.grey, end: Colors.blue).animate(_animationController),
          valueColor: AlwaysStoppedAnimation(Colors.orange),
          strokeWidth: 5,
        ),
      )).toList(),
    );
  }
}
