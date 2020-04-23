import 'package:flutter/material.dart';

/// create by 张风捷特烈 on 2020-03-27
/// contact me by email 1981462002@qq.com
/// 说明:
//    {
//      "widgetId": 162,
//      "name": 'ListView基本使用',
//      "priority": 1,
//      "subtitle":
//          "【children】 : 子组件列表   【List<Widget>】\n"
//          "【padding】 : 点击事件  【EdgeInsetsGeometry】",
//    }
class CustomListView extends StatelessWidget {
  final data = <Color>[
    Colors.purple[50],
    Colors.purple[100],
    Colors.purple[200],
    Colors.purple[300],
    Colors.purple[400],
    Colors.purple[500],
    Colors.purple[600],
    Colors.purple[700],
    Colors.purple[800],
    Colors.purple[900],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child:  ListView(
          padding: EdgeInsets.symmetric(horizontal: 5),
          children: data
              .map((color) => Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 50,
                    color: color,
                    child: Text(
                      colorString(color),
                      style: TextStyle(color: Colors.white, shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(.5, .5),
                            blurRadius: 2)
                      ]),
                    ),
                  ))
              .toList(),
        ),
    );
  }

  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
}

//    {
//      "widgetId": 162,
//      "name": 'ListView横向滑动',
//      "priority": 2,
//      "subtitle":
//          "【scrollDirection】 : 滑动方向   【Axis】\n"
//          "【reverse】 : 是否反向滑动   【bool】\n"
//          "【shrinkWrap】 : 无边界时是否包裹  【bool】",
//    }
class HorizontalListView extends StatelessWidget {
  final data = <Color>[
    Colors.purple[50],
    Colors.purple[100],
    Colors.purple[200],
    Colors.purple[300],
    Colors.purple[400],
    Colors.purple[500],
    Colors.purple[600],
    Colors.purple[700],
    Colors.purple[800],
    Colors.purple[900],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        reverse: true,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: data
            .map((color) => Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 50,
                  color: color,
                  child: Text(
                    colorString(color),
                    style: TextStyle(color: Colors.white, shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(.5, .5),
                          blurRadius: 2)
                    ]),
                  ),
                ))
            .toList(),
      ),
    );
  }

  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
}

//    {
//      "widgetId": 162,
//      "name": 'ListView.builder构造',
//      "priority": 3,
//      "subtitle":
//          "【itemCount】 : 条目个数   【int】\n"
//          "【itemBuilder】 : 条目构造器   【IndexedWidgetBuilder】",
//    }
class BuilderListView extends StatelessWidget {
  final data = <Color>[
    Colors.purple[50],
    Colors.purple[100],
    Colors.purple[200],
    Colors.purple[300],
    Colors.purple[400],
    Colors.purple[500],
    Colors.purple[600],
    Colors.purple[700],
    Colors.purple[800],
    Colors.purple[900],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => _buildItem(data[index]),
      ),
    );
  }

  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

  Widget _buildItem(Color color) => Container(
        alignment: Alignment.center,
        width: 100,
        height: 50,
        color: color,
        child: Text(
          colorString(color),
          style: TextStyle(color: Colors.white, shadows: [
            Shadow(color: Colors.black, offset: Offset(.5, .5), blurRadius: 2)
          ]),
        ),
      );
}
//    {
//      "widgetId": 162,
//      "name": 'ListView.separated构造',
//      "priority": 3,
//      "subtitle":
//          "【separatorBuilder】 : 条目构造器   【IndexedWidgetBuilder】",
//    }
class SeparatedListView extends StatelessWidget {
  final data = <Color>[
    Colors.purple[50],
    Colors.purple[100],
    Colors.purple[200],
    Colors.purple[300],
    Colors.purple[400],
    Colors.purple[500],
    Colors.purple[600],
    Colors.purple[700],
    Colors.purple[800],
    Colors.purple[900],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          thickness: 1,
          height: 1,
          color: Colors.orange,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) => _buildItem(data[index]),
      ),
    );
  }

  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

  Widget _buildItem(Color color) => Container(
        alignment: Alignment.center,
        width: 100,
        height: 50,
        color: color,
        child: Text(
          colorString(color),
          style: TextStyle(color: Colors.white, shadows: [
            Shadow(color: Colors.black, offset: Offset(.5, .5), blurRadius: 2)
          ]),
        ),
      );
}
