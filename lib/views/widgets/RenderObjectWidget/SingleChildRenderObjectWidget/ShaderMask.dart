import 'package:flutter/material.dart';

/// create by 小官在江湖 on 2020-04-12
/// contact me by email 1981462002@qq.com
/// 说明:
///
//    {
//      "widgetId": 277,
//      "name": '径向渐变着色',
//      "priority": 1,
//      "subtitle":
//          "【child】 : 孩子组件   【Widget】\n"
//          "【shaderCallback】 : 着色器回调   【ShaderCallback】\n"
//          "【blendMode】 : 混色模式   【BlendMode】\n"
//          "    通过RadialGradient#createShader创建径向渐变着色器。",
//    }
class RadialShaderMask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        ShaderMask(
          shaderCallback: _buildShader,
          child: Image.asset(
            'assets/images/icon_head.png',
            height: 70,
            width: 70,
          ),
        ),
        ShaderMask(
          shaderCallback: _buildShader,
          child: Text(
            '小官在江湖',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
        ShaderMask(
          shaderCallback: _buildShader,
          child: Container(
            height: 100,
            color: Colors.white,
            width: 50,
          ),
        ),
      ],
    );
  }

  final colors = [Colors.red, Colors.yellow, Colors.blue];

  Shader _buildShader(Rect bounds) => RadialGradient(
          center: Alignment.topLeft,
          radius: 1.0,
          tileMode: TileMode.mirror,
          colors: colors)
      .createShader(bounds);
}

//    {
//      "widgetId": 277,
//      "name": '线性渐变着色',
//      "priority": 2,
//      "subtitle":
//          "通过LinearGradient#createShader创建线性渐变着色器\n"
//          "着色器相关知识详见【绘制专辑】",
//    }
class LinearShaderMask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        ShaderMask(
          shaderCallback: _buildShader,
          child: Image.asset(
            'assets/images/icon_head.png',
            height: 70,
            width: 70,
          ),
        ),
        ShaderMask(
          shaderCallback: _buildShader,
          child: Text(
            '小官在江湖',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
        ShaderMask(
          shaderCallback: _buildShader,
          child: Container(
            height: 100,
            color: Colors.white,
            width: 50,
          ),
        ),
      ],
    );
  }

  final colors = [Colors.red, Colors.yellow, Colors.blue];

  Shader _buildShader(Rect bounds) => LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          tileMode: TileMode.mirror,
          colors: colors)
      .createShader(bounds);
}
