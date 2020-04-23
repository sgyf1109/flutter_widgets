import 'package:flutter/material.dart';

/// create by 张风捷特烈 on 2020-03-25
/// contact me by email 1981462002@qq.com
/// 说明:

//    {
//      "widgetId": 146,
//      "name": 'GestureDetector基本事件',
//      "priority": 1,
//      "subtitle":
//          "【child】 : 子组件   【Widget】\n"
//          "【onTap】 : 点击事件   【Function()】\n"
//          "【onDoubleTap】 : 双击事件   【Function()】\n"
//          "【onLongPress】 : 长按事件   【Function()】",
//    }

class CustomGestureDetector extends StatefulWidget {
  @override
  _CustomGestureDetectorState createState() => _CustomGestureDetectorState();
}

class _CustomGestureDetectorState extends State<CustomGestureDetector> {
  var _info = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _info = 'onTap'),
      onDoubleTap: () => setState(() => _info = 'onDoubleTap'),
      onLongPress: () => setState(() => _info = 'onLongPress'),
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 300 * 0.4,
        color: Colors.grey.withAlpha(33),
        child: Text(
          _info,
          style: TextStyle(fontSize: 18, color: Colors.blue),
        ),
      ),
    );
  }
}

//    {
//      "widgetId": 146,
//      "name": 'GestureDetector详情信息',
//      "priority": 2,
//      "subtitle":
//          "【onTapDown】 : 按下回调   【Function(TapDownDetails)】\n"
//          "【onTapUp】 : 子组件   【Function(TapUpDetails)】\n"
//          "【onTapCancel】 : 点击取消   【Function()】",
//    }
class TapGestureDetector extends StatefulWidget {
  @override
  _TapGestureDetectorState createState() => _TapGestureDetectorState();
}

class _TapGestureDetectorState extends State<TapGestureDetector> {
  var _info = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (detail) => setState(() => _info =
          'onTapDown:\n相对落点:${detail.localPosition}\n绝对落点:${detail.globalPosition}'),
      onTapUp: (detail) => setState(() => _info =
          'onTapUp:\n相对落点:${detail.localPosition}\n绝对落点:${detail.globalPosition}'),
      onTapCancel: () => setState(() => _info = 'onTapCancel'),
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 300 * 0.618,
        color: Colors.grey.withAlpha(33),
        child: Text(
          _info,
          style: TextStyle(fontSize: 18, color: Colors.blue),
        ),
      ),
    );
  }
}

//    {
//      "widgetId": 146,
//      "name": 'GestureDetector的Pan事件',
//      "priority": 3,
//      "subtitle":
//          "【onPanDown】 : 按下回调   【Function(DragDownDetails)】\n"
//          "【onPanEnd】 : 拖动结束   【Function(DragEndDetails)】\n"
//          "【onPanStart】 : 开始拖动   【Function(DragStartDetails)】\n"
//          "【onPanUpdate】 : 拖动更新   【Function(TapUpDetails)】\n"
//          "【onPanCancel】 : 拖动取消   【Function()】",
//    }
class PanGestureDetector extends StatefulWidget {
  @override
  _PanGestureDetectorState createState() => _PanGestureDetectorState();
}

class _PanGestureDetectorState extends State<PanGestureDetector> {
  var _info = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (detail) => setState(() => _info =
          'onPanDown:\n相对落点:${detail.localPosition}\n绝对落点:${detail.globalPosition}'),
      onPanEnd: (detail) => setState(() => _info =
          'onPanEnd:\n初速度:${detail.primaryVelocity}\n最终速度:${detail.velocity}'),
      onPanUpdate: (detail) => setState(() => _info =
          'onPanUpdate:\n相对落点:${detail.localPosition}\n绝对落点:${detail.globalPosition}'),
      onPanStart: (detail) => setState(() => _info =
          'onPanStart:\n相对落点:${detail.localPosition}\n绝对落点:${detail.globalPosition}'),
      onPanCancel: () => setState(() => _info = 'onTapCancel'),
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 300 * 0.618,
          color: Colors.grey.withAlpha(33),
          child: Text(
            _info,
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
