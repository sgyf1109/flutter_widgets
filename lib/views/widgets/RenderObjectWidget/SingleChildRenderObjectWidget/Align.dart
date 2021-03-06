import 'dart:math';

import 'package:flutter/material.dart';

//    {
//      "widgetId": 85,
//      "name": 'Align基本使用',
//      "priority": 1,
//      "subtitle":
//          "【child】 : 孩子组件   【Widget】\n"
//          "【alignment】 : 对齐方式   【AlignmentGeometry】",
//    }
class CustomAlign extends StatelessWidget {
  final alignments = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  final alignmentsInfo = [
    "topLeft",
    "topCenter",
    "topRight",
    "centerLeft",
    "center",
    "centerRight",
    "bottomLeft",
    "bottomCenter",
    "bottomRight",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: alignments
            .toList()
            .map((mode) => Column(children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 60,
                      color: Colors.grey.withAlpha(88),
                      child: Align(
                          child: Container(
                            width: 30,
                            height: 30,
                            color: Colors.cyanAccent,
                          ),
                          alignment: mode)),
                  Text(alignmentsInfo[alignments.indexOf(mode)])
                ]))
            .toList());
  }
}
//    {
//      "widgetId": 85,
//      "name": 'Align其他用法',
//      "priority": 2,
//      "subtitle":
//          "由于Alignment对象可指定在父容器中宽高的分率位置\n"
//          "可以使用Align实现一些复杂的排布需求，比如按指定的数学方程变化位置",
//    }
class Ball extends StatelessWidget {
  Ball({
    Key key,
    this.radius = 15,
    this.color = Colors.blue,
  }) : super(key: key);
  final double radius; //半径
  final Color color; //颜色

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class SinLayout extends StatefulWidget {
  SinLayout({
    Key key,
  }) : super(key: key);

  @override
  _SinLayoutState createState() => _SinLayoutState();
}

class _SinLayoutState extends State<SinLayout> {
  var _x = 0.0; //Alignment坐标系上的x坐标

  @override
  Widget build(BuildContext context) {
    var item = Container(
      width: 300,
      height: 120,
      color: Colors.black.withAlpha(10),
      child: Align(
        child: Ball(
          color: Colors.orangeAccent,
        ),
        alignment: Alignment(_x, f(_x * pi)),
      ),
    );

    var slider = Slider(
        max: 180,
        min: -180,
        divisions: 360,
        label: "${_x.toStringAsFixed(2)}π",
        value: _x * 180,//value范围必须在max和min之间
        onChanged: (v) => setState((){
          print("数值"+"${_x}");
         return _x = v / 180;
        }));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[slider, item],
    );
  }

  double f(x) {
    //映射函数 -- 可随意指定
    double y = sin(x);
    return y;
  }
}
