import 'package:flutter/material.dart';
import 'package:flutterwidgets/app/res/cons.dart';

//    {
//      "widgetId": 87,
//      "name": 'FittedBox基本使用',
//      "priority": 1,
//      "subtitle":
//          "【child】 : 孩子组件   【Widget】\n"
//          "【fit】 : 适应模式   【BoxFit】\n"
//          "【alignment】 : 对齐方式   【AlignmentGeometry】",
//    }
class CustomFittedBox extends StatefulWidget {
  @override
  _CustomFittedBoxState createState() => _CustomFittedBoxState();
}

class _CustomFittedBoxState extends State<CustomFittedBox> {
  double _childW = 20;
  double _childH = 30;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
            spacing: 10,
            runSpacing: 10,
            children: BoxFit.values
                .map((mode) => Column(
                      children: <Widget>[
                        _buildChild(mode),
                        SizedBox(
                          height: 10,
                        ),
                        Text(mode.toString().split('.')[1])
                      ],
                    ))
                .toList()),
        _buildSlider()
      ],
    );
  }

  Widget _buildChild(BoxFit m) {
    return Container(
      color: Colors.grey.withAlpha(44),
      width: 80,
      height: 60,
      child: FittedBox(
        fit: m,
        child: Container(
          width: _childW,
          height: _childH,
          decoration: BoxDecoration(
            //添加渐变色
            gradient: LinearGradient(
                stops: <double>[0.0, 1 / 6, 2 / 6, 3 / 6, 4 / 6, 5 / 6, 1.0],
                colors: Cons.rainbow.map((e) => Color(e)).toList()),
          ),
        ),
      ),
    );
  }

  Widget _buildSlider() => Column(
        children: <Widget>[
          Slider(
              min: 10,
              max: 150,
              divisions: 100,
              label: '子宽度:' + _childW.toStringAsFixed(1),
              value: _childW,
              onChanged: (v) => setState(() => _childW = v)),
          Slider(
              min: 10,
              max: 150,
              divisions: 100,
              label: '子高度:' + _childH.toStringAsFixed(1),
              value: _childH,
              onChanged: (v) => setState(() => _childH = v)),
        ],
      );
}
