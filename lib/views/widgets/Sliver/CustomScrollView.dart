import 'package:flutter/material.dart';

/// create by 小官在江湖 on 2020-03-30
/// contact me by email 1981462002@qq.com
/// 说明:
//    {
//      "widgetId": 183,
//      "name": 'CustomScrollView基本使用',
//      "priority": 1,
//      "subtitle":
//          "【slivers】 : 子组件列表   【List<Widget>】\n"
//          "【reverse】 : 是否反向   【bool】\n"
//          "【scrollDirection】 : 滑动方向   【Axis】\n"
//          "【controller】 : 控制器   【ScrollController】",
//    }
class CustomScrollViewDemo extends StatelessWidget {
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
      height: 300,
      child: CustomScrollView(
        anchor: 0,
        scrollDirection: Axis.vertical,
        reverse: false,
        slivers: <Widget>[_buildSliverAppBar(), _buildSliverFixedExtentList()],
      ),
    );
  }

  Widget _buildSliverFixedExtentList() => SliverFixedExtentList(//SliverFixedExtentList 高度固定死.
        itemExtent: 60,
        delegate: SliverChildBuilderDelegate(
            (_, int index) => Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 50,
                  color: data[index],
                  child: Text(
                    colorString(data[index]),
                    style: TextStyle(color: Colors.white, shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(.5, .5),
                          blurRadius: 2)
                    ]),
                  ),
                ),
            childCount: data.length),
      );

  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

  _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,//是否置顶
      expandedHeight: 190.0,
      leading: Container(
          margin: EdgeInsets.all(10),
          child: Image.asset('assets/images/icon_head.png')),
      flexibleSpace: FlexibleSpaceBar(
        //伸展处布局
        titlePadding: EdgeInsets.only(left: 55, bottom: 15), //标题边距
        collapseMode: CollapseMode.parallax, //视差效果,背景不会跟着滚
        title: Text(
          '小官在江湖',
          style: TextStyle(color: Colors.black, //标题
              shadows: [
                Shadow(color: Colors.blue, offset: Offset(1, 1), blurRadius: 2)
              ]),
        ),
        background: Image.asset(
          "assets/images/caver.jpeg", fit: BoxFit.cover,
        ),
      ),
    );
  }
}
